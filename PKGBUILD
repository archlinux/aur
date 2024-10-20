# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: 1Conan <me@1conan.com>
# Contributor: hendy643 <phenderson643@gmail.com>

_target=aarch64-none-linux-gnu
pkgname=${_target}-gcc-bin
pkgver=13.3
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 Linux target"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')
#                                                                              arm-gnu-toolchain-${pkgver}.rel${pkgrel}-${arch}-${_target}.tar.xz
source=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}.rel${pkgrel}/binrel/arm-gnu-toolchain-${pkgver}.rel${pkgrel}-${arch}-${_target}.tar.xz)
sha256sums=('322f0b4482fc0d9fa0bb468134841f08d8c554c54ff5aa29a13a7a24bf7e1eb5')
options=('!strip' '!debug' '!emptydirs' 'staticlibs')
provides=(aarch64-none-linux-gnu-gcc aarch64-none-linux-gnu-gcc-binutils aarch64-none-linux-gnu-gdb)
conflicts=( 'aarch64-linux-gnu-binutils' 
            'aarch64-linux-gnu-gcc' 
            'aarch64-linux-gnu-gdb' 
            'aarch64-linux-gnu-glibc' 
            'aarch64-linux-gnu-linux-api-headers'
            'aarch64-none-linux-gnu-gcc-12.3-bin'
            'aarch64-none-linux-gnu-gcc-10.3-bin'
            'aarch64-none-linux-gnu-gcc-9.2-bin'            
)

package() {
  mkdir -p ${pkgdir}/usr
  # arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu
  cp -a ${srcdir}/arm-gnu-toolchain-${pkgver}.rel${pkgrel}-x86_64-${_target}/* ${pkgdir}/usr

  rm -f ${pkgdir}/usr/license.txt
  rm -f ${pkgdir}/usr/*-manifest.txt
  rm -rf ${pkgdir}/usr/lib64
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/share/{doc,gcc-*,gdb,info,locale}
  rm -rf ${pkgdir}/usr/share/man/{man5,man7}
  rm -rf ${pkgdir}/usr/lib/bfd-plugins/libdep.so
}
