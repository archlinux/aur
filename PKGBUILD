# Maintainer: Sergiy Kukunin <sergey.kukunin@gmail.com>

pkgname=cpuminer-multi
pkgver=1.0.3
pkgrel=1
pkgdesc="Multi-algo CPUMiner & Reference Cryptonote Miner (JSON-RPC 2.0)"
arch=('i686' 'x86_64')
url="https://github.com/lucasjones/cpuminer-multi"
conflicts=('cpuminer')
depends=('curl' 'jansson')
license=('GPL')
source=("${pkgname}-${pkgver}.zip::https://github.com/lucasjones/cpuminer-multi/archive/v${pkgver}.zip"
        'libcurl.m4')
md5sums=('81757017c99bd9c04500495d6a20aa38'
         '5e22a13d29fa628c83c267cf9b4f3218')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fi -I ..
  ./configure
  make CXXFLAGS="-O3 -march=native"
}


package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 "$srcdir/$pkgname-$pkgver/minerd" "$pkgdir/usr/bin/"
}
