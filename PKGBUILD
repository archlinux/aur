# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=guile-ini
pkgver=0.5.4
pkgrel=1
pkgdesc="A GNU Guile library for working with INI format"
arch=('x86_64')
url="https://github.com/artyom-poptsov/guile-ini"
license=('GPL-3.0-or-later')
depends=('guile' 'guile-lib' 'guile-smc')
source=("https://github.com/artyom-poptsov/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('68f7774ad214564caff1955c17ff506f897b3f555e89b942a31e6f64f3c85d87')

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
