# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Ian Yang <doit.ian@gmail.com>

pkgname=google-glog-static
pkgver=0.3.5
pkgrel=1
pkgdesc="Logging library for C++"
arch=('x86_64')
license=('custom:BSD3')
url='https://github.com/google/glog'
depends=('gcc-libs')
makedepends=('cmake')
options=('staticlibs')
source=("glog-$pkgver.tar.gz::https://github.com/google/glog/archive/v$pkgver.tar.gz")
provides=('google-glog')
conflicts=('google-glog')
sha256sums=('7580e408a2c0b5a89ca214739978ce6ff480b5e7d8d7698a2aa92fadc484d1e0')

build() {
  cd glog-$pkgver
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd glog-$pkgver/build

  make DESTDIR="$pkgdir" install

  # Lazy way of dealing with conflicting man and info pages...
  rm -rf "$pkgdir"/usr/share

  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
