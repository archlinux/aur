# Maintainer: Duong Pham <dthpham@gmail.com>
# Contributor: Lazaros Koromilas <koromilaz@gmail.com>
pkgname=khronos-ocl-icd
pkgver=1.2.11.0
pkgrel=1
pkgdesc="Khronos Group OpenCL 1.2 installable client driver (ICD) loader"
arch=('any')
url="http://www.khronos.org/registry/cl"
license=('custom')
makedepends=('cmake' 'mesa')
depends=('opencl-headers>=1.2')
provides=('libcl' 'opencl-icd-loader')
conflicts=('libcl')
replaces=('libcl')
source=("http://www.khronos.org/registry/cl/specs/opencl-icd-${pkgver}.tgz")
sha256sums=('bb82a4bfec8d2fe3839c1f079554990af2229bbd52f31acec31d0c4e11e99048')
_pkgdir=icd

build() {
  cd "${srcdir}/${_pkgdir}"
  make
}

package() {
  cd "${srcdir}/${_pkgdir}"
  install -d -m755 "${pkgdir}/etc/OpenCL/vendors"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 bin/libOpenCL.so.1.2 "${pkgdir}/usr/lib/libOpenCL.so.1.2"
  cd "${pkgdir}/usr/lib"
  ln -s libOpenCL.so.1.2 libOpenCL.so.1
  ln -s libOpenCL.so.1.2 libOpenCL.so
}
