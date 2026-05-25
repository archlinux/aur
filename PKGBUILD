# Maintainer: duanluan <duanluan@outlook.com>

pkgname=wuyou-toolkit-bin
_pkgname=wuyou-toolkit
pkgver=0.3.0
pkgrel=1
pkgdesc='Native shell for wuyou-toolkit (prebuilt binary)'
arch=('x86_64')
url='https://github.com/duanluan/wuyou-toolkit-releases'
license=('unknown')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('wuyou-toolkit')
conflicts=('wuyou-toolkit')
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/duanluan/wuyou-toolkit-releases/releases/download/v0.3.0/wuyou-toolkit_0.3.0_amd64.deb")
sha256sums=('9374eb191bcf741672c2d711081e95919213e4f320e0b49cc302443db6f4555b')

package() {
  local _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.gz"

  sed -i     -e 's/^Name=.*/Name=Wuyou Toolkit/'     -e 's/^Comment=.*/Comment=Cross-platform desktop toolbox/'     -e 's/^Categories=.*/Categories=Utility;Development;/'     "${pkgdir}/usr/share/applications/wuyou-toolkit.desktop"
}
