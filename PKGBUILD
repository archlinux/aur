# $Id$
# Maintainer: Matthias Riegler <matthias@xvzf.tech>

pkgname=libattr-aarch64
pkgver=2.4.47
pkgrel=3
pkgdesc="Extended attribute support library for ACL support"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/attr"
license=('LGPL')
depends=('glibc' 'aarch64-linux-gnu-gcc')
makedepends=('gettext')
source=(https://download.savannah.gnu.org/releases/attr/attr-$pkgver.src.tar.gz{,.sig})
sha256sums=('25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859'
            'SKIP')
validpgpkeys=('600CD204FBCEA418BD2CA74F154343260542DF34') # Brandon Philips

build() {
  cd attr-$pkgver

  export CROSS=aarch64-linux-gnu
  export CC=${CROSS}-gcc
  export LD=${CROSS}-ld
  export AS=${CROSS}-as
  export CXX=${CROSS}-g++
  export CFLAGS="-O3" # Needed for cross compiling!

  export INSTALL_USER=root INSTALL_GROUP=root
  ./configure --prefix=/usr/aarch64-linux-gnu --host=aarch64-linux-gnu
  make
}

package() {
  cd attr-$pkgver
  make DIST_ROOT="$pkgdir" install-lib install-dev

  # tidy up
  chmod 0755 "$pkgdir"/usr/aarch64-linux-gnu/lib/libattr.so.*.*.*
}
