# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=guile-dsv
pkgver=0.7.2
pkgrel=2
pkgdesc="Delimiter-separated values (DSV) format parser for GNU Guile."
arch=('x86_64')
url="https://github.com/artyom-poptsov/guile-dsv"
license=('GPL-3.0-or-later')
depends=('guile' 'guile-lib' 'guile-smc')
makedepends=('help2man')
source=("https://github.com/artyom-poptsov/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('49cc236d58b9bfb35c795e4a62b0a9cb337ff1880d1d52202ca757d8354d785e')

build() {
  cd "$pkgname-$pkgver"
  local sitedir=$(guile-config info sitedir)
  autoreconf -fi
  ./configure \
    --enable-silent-rules \
    --prefix=/usr \
    --with-guilesitedir=$sitedir
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
