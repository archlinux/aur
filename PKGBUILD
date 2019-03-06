# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=tines
pkgver=1.11.1
pkgrel=1
pkgdesc="A hierarchical console-based outliner/planner/notebook and fork of HNB."
arch=('i686' 'x86_64')
url="https://github.com/larrykollar/tines"
license=("GPL2")
depends=('ncurses')
source=("https://github.com/larrykollar/tines/archive/v$pkgver.tar.gz")
md5sums=('b53fc69e0a1c163d2d3b9e3df11df346')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|^MANDIR=.*$|MANDIR=/usr/share/man|' Makefile
  # no PREFIX support
  sed -i 's|/local/|/|' Makefile
  # no DESTDIR support
  sed -i "s|DIR=|&$pkgdir|" Makefile
  # linux is also a normal unix
  sed -i "s|INSTFLAGS=-D|INSTFLAGS=-d|" Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}
