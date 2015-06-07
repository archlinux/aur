# Maintainer: Elbarto
pkgname=binfmt_aout
pkgver=3.19
pkgrel=1
pkgdesc='binfmt_aout kernel module, for running an a.out binary format'
arch=('i686')
makedepends=('linux-headers' 'linux-api-headers' 'gzip')
url="https://www.kernel.org"
license=("GPLv3")
options=('!strip')
source=("https://raw.githubusercontent.com/torvalds/linux/v{$pkgver}/fs/binfmt_aout.c"
        "Makefile")
sha1sums=('461efd1c09b0b2420c1544ba5ec94952ecef4255'
          '24969cd0bfe0eba16b15a714839891615001842f')
install=binfmt_aout.install

build(){ 
cd "$srcdir" 
  make   
}

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/lib/modules
  make install INSTALL_MOD_PATH="${pkgdir}"
#  gzip "${pkgdir}/lib/modules/`uname -r`/extra/binfmt_aout.ko"
}
