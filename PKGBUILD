# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=cpuminer-opt
pkgver=3.13.1
pkgrel=1
pkgdesc='Optimized multi-algo CPU miner'
arch=('x86_64')
url='https://github.com/JayDDee/cpuminer-opt'
license=('GPL')
depends=('curl' 'gmp' 'jansson' 'openssl')
provides=('cpuminer' 'cpuminer-multi')
conflicts=('cpuminer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c79806b613a6c836bb15e20d5da06953dc5d4b60d762c2c0e9ad86152f03aa4d')

build() {
  cd "$pkgname-$pkgver"

  # -fcommon needed to work around https://github.com/JayDDee/cpuminer-opt/issues/264
  CFLAGS+=' -Wa,--noexecstack -fcommon'
  ./autogen.sh
  ./configure --prefix=/usr --with-crypto --with-curl
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
