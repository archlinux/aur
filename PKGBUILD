# Maintainer: duanluan <duanluan@outlook.com>

pkgname=wuyou-toolkit-bin
_pkgname=wuyou-toolkit
pkgver=0.4.0
pkgrel=1
pkgdesc='Native shell for wuyou-toolkit (prebuilt binary)'
arch=('x86_64')
url='https://github.com/duanluan/wuyou-toolkit-releases'
license=('unknown')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('wuyou-toolkit')
conflicts=('wuyou-toolkit')
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/duanluan/wuyou-toolkit-releases/releases/download/v0.4.0/wuyou-toolkit_0.4.0_amd64.deb")
sha256sums=('eba078d164a78f1b8df896c41f08702be23cdec1717fdf9586f3fff2df6a0db3')

package() {
  local _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.gz"

  sed -i     -e 's/^Name=.*/Name=Wuyou Toolkit/'     -e 's/^Comment=.*/Comment=Cross-platform desktop toolbox/'     -e 's/^Categories=.*/Categories=Utility;Development;/'     "${pkgdir}/usr/share/applications/wuyou-toolkit.desktop"
}
