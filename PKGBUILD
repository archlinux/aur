# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=cpuminer-opt
pkgver=3.12.1
pkgrel=1
pkgdesc='Optimized multi-algo CPU miner'
arch=('x86_64')
url='https://github.com/JayDDee/cpuminer-opt'
license=('GPL')
depends=('curl' 'gmp' 'jansson' 'openssl')
provides=('cpuminer' 'cpuminer-multi')
conflicts=('cpuminer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ace846e4b6e5e3c2a62f2f4c5561ef7951dffc8915cd1fccce9379251ed6f507')

build() {
  cd "$pkgname-$pkgver"

  CFLAGS+=' -Wa,--noexecstack'
  ./autogen.sh
  ./configure --prefix=/usr --with-crypto --with-curl
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
