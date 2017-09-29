# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=guile-commonmark
pkgver=0.1
pkgrel=1
pkgdesc="Guile library for parsing CommonMark"
arch=('any')
url="https://github.com/OrangeShark/guile-commonmark"
license=('LGPL3')
depends=('guile')
source=("https://github.com/OrangeShark/guile-commonmark/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "fix-guile-version.patch")
sha512sums=('cacb58392b0c5bc69e06da04b2f1d8ea7d6e8a06f1d76a92a7a6fbd97279a234ba435f065ee928343f96bdce5becf61d503a3d1a674a61d3a3d2d86f951f6f38'
            '76b47b8ab054bfea9dec221d796db1cb01eb6de0742f24082a1fabdba9478eb35c131abecfb6dd642937a13e15fc6a5b38b18b3c60f2531cd966fec4b7020325')

prepare() {
  cd "$pkgname"-"$pkgver"
  patch -p1 -i "$srcdir"/fix-guile-version.patch
}

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
}
