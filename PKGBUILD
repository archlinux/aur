# Contributor: Rose Kunkel <rose at rosekunkel dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-config
pkgver=0.5.0
pkgrel=1
pkgdesc='Configuration management library for GNU Guile'
arch=('x86_64')
url='https://gitlab.com/a-sassmannshausen/guile-config'
license=('GPL3')
depends=('guile')
source=("https://gitlab.com/a-sassmannshausen/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1b5850462afc0d336b55af07b9ff373a50527533112ee6c10c9932b19ffada61')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -vif
  GUILE_EFFECTIVE_VERSION=2.2 ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  GUILE_EFFECTIVE_VERSION=2.2 make -k check
}

package() {
  cd "$pkgname-$pkgver"
  GUILE_EFFECTIVE_VERSION=2.2 make DESTDIR="$pkgdir/" install
}
