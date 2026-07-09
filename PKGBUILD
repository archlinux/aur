# Maintainer: duanluan <duanluan@outlook.com>

pkgname=wuyou-docs-bin
_pkgname=wuyou-docs
pkgver=0.4.1
pkgrel=1
pkgdesc='Local-first desktop document workspace (prebuilt binary)'
arch=('x86_64')
url='https://github.com/duanluan/wuyou-docs-releases'
license=('unknown')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('wuyou-docs')
conflicts=('wuyou-docs')
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/duanluan/wuyou-docs-releases/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('6ed1e5f28beb8d5b13955d6a6327aab8be45a79c7b7fc1a668bd4e0cc31a1cef')

package() {
  local _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.gz"

  sed -i     -e 's/^Name=.*/Name=Wuyou Docs/'     -e 's/^Comment=.*/Comment=Local-first desktop document workspace/'     -e 's/^Categories=.*/Categories=Office;Utility;/'     "${pkgdir}/usr/share/applications/wuyou-docs.desktop"
}
