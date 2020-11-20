# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>

_name='Beekeeper Studio'
_pkgname='beekeeper-studio'
pkgname="${_pkgname}-bin"

pkgver=1.8.10
pkgrel=1
_commit_license='5c3257cf1989ca38b651a9dad77d81ace18961de'

pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'aarch64')
url='https://www.beekeeperstudio.io'
_url_source='https://github.com/beekeeper-studio/beekeeper-studio'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-license-${_commit_license}::${_url_source}/raw/${_commit_license}/LICENSE.md")
source_x86_64=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")

sha256sums=('787ebc78ce29cd0cea3e52651936df7fef96b117782882fce389c3b7ce5683f5')
sha256sums_x86_64=('b798da8f8cb2affbae26a339aea3c07c2403fc8334d894a3d611fe0d9916749e')
sha256sums_aarch64=('4e3b11df03ca23c30e8c83399faa553d615853dc0c3203a9839d329afe77093d')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/${_name}/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/${_name}/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dvm644 "${_pkgname}-license-${_commit_license}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
