# Maintainer: SebRmv
pkgname=ia32_aout
pkgver=4.16
pkgrel=2
pkgdesc='ia32_aout kernel module, for running an a.out binary format'
arch=('x86_64')
makedepends=('linux-headers' 'linux-api-headers' 'gzip' 'awk')
url="https://www.kernel.org"
license=("GPLv3")
options=('!strip')
source=("https://raw.githubusercontent.com/torvalds/linux/v${pkgver}/arch/x86/ia32/ia32_aout.c"
        "Makefile")
sha1sums=('7b57d6699c98cbda0af10509e2811f1f9fd1e6dc'
          '12bf91fd45d97f76316d242f482bd8b22c77d37e')
install=ia32_aout.install

_kernel_version=$(uname -r)
_kernel_version_x64=$(uname -r | awk -F . '{print $1"."$2}')

build(){ 
  cd "$srcdir" 
  make KVERSION=${_kernel_version}  
}

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/usr/lib/modules/extramodules-"${_kernel_version_x64}"-ARCH
  install "${pkgname}".ko "${pkgdir}"/usr/lib/modules/extramodules-"${_kernel_version_x64}"-ARCH
  gzip "${pkgdir}"/usr/lib/modules/extramodules-"${_kernel_version_x64}"-ARCH/"${pkgname}".ko
}
