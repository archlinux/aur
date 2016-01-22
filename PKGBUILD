# Maintainer: mnovick1988 <anonymous>
# Contributor: Giovanni Condello <condellog@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

pkgname=khronos-ocl-icd-svn
_pkgname=icd
_pkgdir=icd
pkgver=2.0.5.0.r32373
pkgrel=1
epoch=1
pkgdesc="Khronos Group OpenCL 1.2 installable client driver (ICD) loader"
arch=('any')
url='http://www.khronos.org/registry/cl/'
license=('custom')
makedepends=('cmake' 'mesa')
depends=('opencl-headers')
provides=('libcl' 'opencl-icd-loader' 'ocl-icd')
conflicts=('libcl')
replaces=('libcl')
source=("https://cvs.khronos.org/svn/repos/registry/trunk/public/cl/icd/2.0/opengl-icd-2.0.5.0.tgz")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  make
}


package() {
  cd "$srcdir/$_pkgname"

  install -d -m755 "${pkgdir}/etc/OpenCL/vendors"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 bin/libOpenCL.so.1.2 "${pkgdir}/usr/lib/libOpenCL.so.1.2"
  install -D -m755 bin/icd_loader_test  "${pkgdir}/usr/bin/icd_loader_test"
  install -D -m755 bin/libIcdLog.so  "${pkgdir}/usr/lib/libIcdLog.so"
  install -D -m755 bin/libOpenCLDriverStub.so "${pkgdir}/usr/lib/libOpenCLDriverStub.so"
  install -d -m755 "${pkgdir}/usr/include" 
  install -D -m755 icd_dispatch.h "${pkgdir}/usr/include/icd_dispatch.h"
  install -D -m755 icd.h "${pkgdir}/usr/include/icd.h"
  
  cd "${pkgdir}/usr/lib"
  ln -s libOpenCL.so.1.2 libOpenCL.so.1
  ln -s libOpenCL.so.1.2 libOpenCL.so
}
