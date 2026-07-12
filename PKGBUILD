# Maintainer: duanluan <duanluan@outlook.com>

pkgname=wuyou-docs-bin
_pkgname=wuyou-docs
pkgver=0.5.1
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
sha256sums=('8c541d3b15281e1d42e2683b7a1bf736cd484289d56601252ba424c5b3464ff1')

package() {
  local _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.gz"

  sed -i     -e 's/^Name=.*/Name=Wuyou Docs/'     -e 's/^Comment=.*/Comment=Local-first desktop document workspace/'     -e 's/^Categories=.*/Categories=Office;Utility;/'     "${pkgdir}/usr/share/applications/wuyou-docs.desktop"
}
