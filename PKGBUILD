# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Previous maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=cpuminer
pkgver=2.5.1
pkgrel=1
pkgdesc="pooler's Litecoin cpuminer"
arch=('i686' 'x86_64')
url="https://github.com/pooler/cpuminer"
depends=('curl' 'jansson')
license=('GPL')
source=("${pkgname}-${pkgver}.zip::https://github.com/pooler/cpuminer/archive/v${pkgver}.zip"
        'libcurl.m4')
md5sums=('908dcb5a81e3dadc5ed35d865a3200ca'
         '5e22a13d29fa628c83c267cf9b4f3218')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fi -I ..
  ./configure
  # optional optimization for your machine
  #make CXXFLAGS="-O3 -march=native"
  make
}


package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 "$srcdir/$pkgname-$pkgver/minerd" "$pkgdir/usr/bin/"
}
