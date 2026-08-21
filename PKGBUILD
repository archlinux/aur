# Maintainer: duanluan <duanluan@outlook.com>

pkgname=wuyou-toolkit
_pkgname=wuyou-toolkit
pkgver=0.5.0
pkgrel=1
pkgdesc='Native shell for wuyou-toolkit (prebuilt binary)'
arch=('x86_64')
url='https://github.com/duanluan/wuyou-toolkit-releases'
license=('NOASSERTION')
depends=('gtk3' 'webkit2gtk-4.1')
provides=("wuyou-toolkit-bin=${pkgver}")
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/duanluan/wuyou-toolkit-releases/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('35721f4d8f60c76a8a938cc75a49f4fadca38cb4fa60b1ca91ca4f99193adb10')

package() {
  local _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.gz"

  sed -i     -e 's/^Name=.*/Name=Wuyou Toolkit/'     -e 's/^Comment=.*/Comment=Cross-platform desktop toolbox/'     -e 's/^Categories=.*/Categories=Utility;Development;/'     "${pkgdir}/usr/share/applications/wuyou-toolkit.desktop"
}
