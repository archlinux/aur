# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Nicolas Quiénot < niQo at aur >

pkgname=libkqueue
pkgver=2.6.2
pkgrel=1
pkgdesc="userspace implementation of the kqueue kernel event notification mechanism found in FreeBSD and other BSD-based"
url="https://github.com/mheily/libkqueue"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('cmake')
options=('!libtool')
source=(https://github.com/mheily/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('c3502d918ad167957302314b6d97e14052beabc5f5698ea76d0527878900d300')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ../$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  cd ../$pkgname-$pkgver
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
