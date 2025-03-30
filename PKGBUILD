# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Rose Kunkel <rose@rosekunkel.me>

pkgname=guile-hall
pkgver=0.4.1
pkgrel=3
pkgdesc='Project manager and build tool for GNU guile'
arch=('x86_64')
url='https://gitlab.com/a-sassmannshausen/guile-hall'
license=('GPL3')
depends=('git' 'guile' 'guile-config' 'texinfo')
optdepends=('guix: for GNU Guix integration')
source=("https://gitlab.com/a-sassmannshausen/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8bf70fa795db3032be710a41fd316b92a87da2c2c909658412d0c36c4142e9be')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -vif
  GUILD=/usr/bin/guild ./configure --prefix=/usr
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
