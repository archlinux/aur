# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=guile-ini
pkgver=0.5.5
pkgrel=1
pkgdesc="A GNU Guile library for working with INI format"
arch=('x86_64')
url="https://github.com/artyom-poptsov/guile-ini"
license=('GPL-3.0-or-later')
depends=('guile' 'guile-lib' 'guile-smc')
source=("https://github.com/artyom-poptsov/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a7eeb0cde2364cc4483bd3ba01c669952d024bfe4a63e809baf7f93fc40cf758')

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
