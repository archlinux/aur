# Maintainer: Matthias Riegler <matthias@xvzf.tech>

pkgname=libutil-linux-aarch64
_pkgmajor=2.30
pkgver=${_pkgmajor}.1
pkgrel=2
pkgdesc="Miscellaneous system utilities for Linux"
url="https://www.kernel.org/pub/linux/utils/util-linux/"
arch=('i686' 'x86_64')
makedepends=('systemd' 'python' 'libcap-ng')
license=('GPL2')
options=('strip' 'debug')
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("https://www.kernel.org/pub/linux/utils/util-linux/v2.30/util-linux-2.30.1.tar."{xz,sign})
md5sums=('5e5ec141e775efe36f640e62f3f8cd0d'
         'SKIP')

build() {
  cd "util-linux-2.30.1"
  export CROSS=aarch64-linux-gnu
  export CC=${CROSS}-gcc
  export LD=${CROSS}-ld
  export AS=${CROSS}-as
  export CXX=${CROSS}-g++
  export CFLAGS="-O3" # Needed for cross compiling!

  ./configure --host=aarch64-linux-gnu --prefix=/usr/aarch64-linux-gnu

}

package(){

  make -C "util-linux-2.30.1" DESTDIR="$pkgdir" install-all-am install-usrlib_execLTLIBRARIES install-nodist_fdiskincHEADERS install-nodist_mountincHEADERS install-nodist_blkidincHEADERS install-uuidincHEADERS
}
