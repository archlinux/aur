# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=cpuminer-opt
pkgver=3.11.6
pkgrel=1
pkgdesc='Optimized multi-algo CPU miner'
arch=('x86_64')
url='https://github.com/JayDDee/cpuminer-opt'
license=('GPL')
depends=('curl' 'gmp' 'jansson' 'openssl')
provides=('cpuminer' 'cpuminer-multi')
conflicts=('cpuminer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3cbd0419ee8b75c908f4de5ad7865f69ce1ae9def46e573418750f5f7a0aabc3')

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
