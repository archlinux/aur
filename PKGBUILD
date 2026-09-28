# Maintainer: duanluan <duanluan@outlook.com>

pkgname=wuyou-toolkit
_pkgname=wuyou-toolkit
pkgver=0.6.0
pkgrel=1
pkgdesc='Native shell for wuyou-toolkit (prebuilt binary)'
arch=('x86_64')
url='https://github.com/duanluan/wuyou-toolkit-releases'
license=('NOASSERTION')
depends=('gtk3' 'webkit2gtk-4.1')
provides=("wuyou-toolkit-bin=${pkgver}")
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/duanluan/wuyou-toolkit-releases/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('c37d7091cf707066002d2832c30d6b63c7083c5994a64b7caa0d0f6bf8252aaf')

package() {
  local _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.gz"

  sed -i     -e 's/^Name=.*/Name=Wuyou Toolkit/'     -e 's/^Comment=.*/Comment=Cross-platform desktop toolbox/'     -e 's/^Categories=.*/Categories=Utility;Development;/'     "${pkgdir}/usr/share/applications/wuyou-toolkit.desktop"
}
