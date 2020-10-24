# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>

_name_upper='Beekeeper Studio'
_pkgname='beekeeper-studio'
pkgname="${_pkgname}-bin"

pkgver=1.8.5
pkgrel=1
_commit_license='5c3257cf1989ca38b651a9dad77d81ace18961de'

pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.beekeeperstudio.io'
_url_source='https://github.com/beekeeper-studio/beekeeper-studio'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("license-${_commit_license}::${_url_source}/raw/${_commit_license}/LICENSE.md")
source_x86_64=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_armv7h=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_armv7l.deb")
source_aarch64=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")

sha256sums=('787ebc78ce29cd0cea3e52651936df7fef96b117782882fce389c3b7ce5683f5')
sha256sums_x86_64=('ffa5630eaeb336fd7f60eb5e6a4ada22f37e5124040a9fbe6ff4f618675350a8')
sha256sums_armv7h=('2ff813606cfadc31c95782a6c68b64825785af80cf0c94d22da07c896186877e')
sha256sums_aarch64=('7e4da3d4ecf8fc1fde435caea3e06166324666cf83d86648c6471c6a7e570f70')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/${_name_upper}/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/${_name_upper}/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dvm644 "license-${_commit_license}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
