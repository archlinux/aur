# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Nicolas Quiénot < niQo at aur >

pkgname=libkqueue
pkgver=2.3.1
pkgrel=1
pkgdesc="userspace implementation of the kqueue kernel event notification mechanism found in FreeBSD and other BSD-based"
url="https://github.com/mheily/libkqueue"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('gcc')
options=('!libtool')
source=(https://github.com/mheily/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('44e187a42c8f8061c323d959742b9cfb53236dd34e5dc9837fea2571bd980efc')

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
