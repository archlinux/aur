# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=cpuminer-opt
pkgver=3.9.2.4
pkgrel=2
pkgdesc='Optimized multi-algo CPU miner'
arch=('x86_64')
url='https://github.com/JayDDee/cpuminer-opt'
license=('GPL')
depends=('curl' 'gmp' 'jansson' 'openssl')
provides=('cpuminer' 'cpuminer-multi')
conflicts=('cpuminer' 'cpuminer-multi' 'cpuminer-multi-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JayDDee/cpuminer-opt/archive/v$pkgver.tar.gz")
sha256sums=('bb36f0ba970b876ac1e4f17297f08e8aeaf66758324e22cfa9a330c0e107ccf1')

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
