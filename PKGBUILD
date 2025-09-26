# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=vde2-git
_pkgname=vde2
pkgver=v2.3.3.r28.6023871
pkgrel=2

pkgdesc="VDEv2: Virtual Distributed Ethernet."
arch=('x86_64')
url='https://github.com/virtualsquare/vde-2'
license=('GPL-2.0' 'LGPL-2.1')
makedepends=('make' 'coreutils' 'cmake' 'vdeplug4')
depends=('vdeplug4')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C vde-2 describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd $srcdir/vde-2
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j $(nproc)
}

package() {
  cd $srcdir/vde-2/build
  make DESTDIR="$pkgdir" install
}

