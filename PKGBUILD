# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Cory Jorgensen <coryj@gmx.com>

pkgname=libtorch-cuda
_name="${pkgname%%-cuda}"
pkgver=2.2.2
_cuver=121
pkgrel=1
pkgdesc='PyTorch C++ API'
arch=('x86_64')
url='pytorch.org'
license=('BSD')
depends=('cuda' 'cudnn' 'cmake' 'onednn')
provides=("${_name}")
conflicts=("${_name}")
source=("${pkgname}-${pkgver}.zip"::"https://download.pytorch.org/libtorch/cu${_cuver}/libtorch-shared-with-deps-${pkgver}%2Bcu${_cuver}.zip")
sha512sums=('c8fc08ec5a195292570e72f65f5ed9c240206cf8c5ed4baf3963bd5654feace476ff7787532e685a2e18a256cfb8332e7b6a20d467bbfbfc8a7c8d1137df3589')
options=(!strip libtool staticlibs)

package() {
  rm ${srcdir}/libtorch/lib/libcudnn*
  rm ${srcdir}/libtorch/include/dnnl*

  install -vDm755 "${srcdir}/libtorch/lib/"* -t "${pkgdir}/usr/lib"
  install -vd "${pkgdir}/usr/include" "${pkgdir}/usr/share/cmake"
  cp -r "${srcdir}/libtorch/include/"* "${pkgdir}/usr/include/"
  cp -r "${srcdir}/libtorch/share/cmake/"* "${pkgdir}/usr/share/cmake/"
} 
