# Maintainer: hendy643 <phenderson643@gmail.com>
# Contributor: 1Conan <me@1conan.com>

_target=aarch64-none-linux-gnu
pkgname=${_target}-gcc-bin
pkgver=15.2.rel1
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 Linux target"
arch=('x86_64' 'aarch64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')

# https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
source_x86_64=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}.tar.xz)
sha256sums_x86_64=('9a685b335bd709d683a8c782253c37e8c36c10e6924e59e39d4769b02132eb43')
source_aarch64=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}.tar.xz)
sha256sums_aarch64=('97e3f600c00413088bb21109475443f9a1c57b4f75336a6e820acd43b065f875')

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
  cp -a ${srcdir}/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}/* ${pkgdir}/usr

  rm -f ${pkgdir}/usr/license.txt
  rm -f ${pkgdir}/usr/*-manifest.txt
  rm -rf ${pkgdir}/usr/lib64
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/share/{doc,gcc-*,gdb,info,locale}
  rm -rf ${pkgdir}/usr/share/man/{man5,man7}
  rm -rf ${pkgdir}/usr/lib/bfd-plugins/libdep.so
}
