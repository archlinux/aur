# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=cpuminer
pkgver=2.4.2
pkgrel=1
pkgdesc="pooler's Litecoin cpuminer"
arch=('i686' 'x86_64')
url="https://github.com/pooler/cpuminer"
depends=('curl' 'jansson')
license=('GPL')
source=("${pkgname}-${pkgver}.zip::https://github.com/pooler/cpuminer/archive/v${pkgver}.zip"
        'libcurl.m4')
md5sums=('63fcadfe26b4a1fe408e1b44e4152bec'
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
