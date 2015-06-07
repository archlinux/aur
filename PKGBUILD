# Maintainer: SebRmv
pkgname=ia32_aout
pkgver=4.0
pkgrel=1
pkgdesc='ia32_aout kernel module, for running an a.out binary format'
arch=('x86_64')
makedepends=('linux-headers' 'linux-api-headers' 'gzip')
url="https://www.kernel.org"
license=("GPLv3")
options=('!strip')
source=("https://raw.githubusercontent.com/torvalds/linux/v{$pkgver}/arch/x86/ia32/ia32_aout.c"
        "Makefile")
sha1sums=('c635114660009c57014eb2a38e50e3abbb5f2e5f'
          '7afa0aad8856552718cc4c2b49625965537406a9')
install=ia32_aout.install

build(){ 
  cd "$srcdir" 
  make   
}

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/lib/modules
  make install INSTALL_MOD_PATH="${pkgdir}"
#  gzip "${pkgdir}/lib/modules/`uname -r`/extra/ia32_aout.ko"
}
