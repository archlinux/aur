# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

_pkgname=vde2
pkgname="${_pkgname}-git"
pkgver=v2.3.3.r60.7e7017b
pkgrel=1

pkgdesc="VDEv2: Virtual Distributed Ethernet."
arch=('x86_64')
url='https://github.com/virtualsquare/vde-2'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=('glibc' 'vdeplug4' 'libpcap' 'wolfssl')
makedepends=('git' 'cmake')
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

