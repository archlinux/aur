# Contributor: Rose Kunkel <rose@rosekunkel.me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-hall
pkgver=0.4.1
pkgrel=2
pkgdesc='Project manager and build tool for GNU guile'
arch=('x86_64')
url='https://gitlab.com/a-sassmannshausen/guile-hall'
license=('GPL3')
depends=('git' 'guile' 'guile-config' 'texinfo')
optdepends=('guix: for GNU Guix integration')
source=("https://gitlab.com/a-sassmannshausen/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('547085953485164a981ca982dd5b8bef0d17cc5b8d6a50ef841a1c80ef39c31a')

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
