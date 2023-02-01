# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=WriteTeX
pkgname=${_base,,}
pkgver=1.8.0
pkgrel=1
pkgdesc="Latex/Tex editor for Inkscape"
arch=(any)
url="https://github.com/wanglongqi/${_base}"
license=(GPL2)
depends=(inkscape python-lxml pdf2svg)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  inkscape-1.2-compatiblity.patch::${url}/commit/bab62e1e85ebd68981c0e79fe525cbcc68fbbbc7.patch)
sha512sums=('252c588a23674a1f5a0e95fe04da5a84f3aed7a3d3d17f3d9557e852772b69d12eae715355d2ebf5139b89d5f14461bf40efa090dcfa5b8d6e40fce86b1310d4'
  'b2a85dd2a216c0581d16ea022fb4a44cb8b790a43a3a14f13fa8de9366a72c0aa4e91dbe82a74f42f395290e13fec566f9a797f485ccc19b60d9b32e64d31ae7')

prepare() {
  cd ${_base}-${pkgver}
  # https://github.com/wanglongqi/WriteTeX/issues/28
  patch -p1 -i ../inkscape-1.2-compatiblity.patch
}

package() {
  cd ${_base}-${pkgver}/1.0.x
  install -m755 -Dt "${pkgdir}/usr/share/inkscape/extensions" ${pkgname}.py
  install -m644 -Dt "${pkgdir}/usr/share/inkscape/extensions" ${pkgname}.inx
}
