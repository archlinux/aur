# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>

_name_upper='Beekeeper Studio'
_pkgname='beekeeper-studio'
pkgname="${_pkgname}-bin"

pkgver=1.8.7
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
sha256sums_x86_64=('a6e58a221e23a75d9e29c6a80853f4cb5cf8844afeebca83d9ffb30382bb7a75')
sha256sums_armv7h=('4cd9fbb25de0055a3176c9d4eb16c6c045f6b5bc500d1a594217dfaeaac3251e')
sha256sums_aarch64=('45968f5e348cdbdf21306687d634e311192da86a64da64266dc8f598ee545c94')

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
