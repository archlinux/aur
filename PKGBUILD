# Maintainer: Nicolas Quiénot < niQo at aur >

pkgname=libkqueue
pkgver=2.1.0
pkgrel=1
pkgdesc="userspace implementation of the kqueue kernel event notification mechanism found in FreeBSD and other BSD-based"
url="https://github.com/mheily/libkqueue"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('gcc')
options=('!libtool')
#source=(https://github.com/mheily/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
source=(https://github.com/mheily/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('e8f7cb2287d3c8b05dc413cd41c032fa')

build() {
  cd "$pkgname-$pkgver"
#  CFLAGS='-fPIC -I./include -I./src/common -Wall -Werror' ./configure --prefix=/usr || return 1
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

