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
makedepends=('cmake')
options=('!libtool')
source=(https://github.com/mheily/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('38fcbcb97555d5409eec9e51cdd3c6a100b5d2a05edbc77c95e2ab49ee4e0836')

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
