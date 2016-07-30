# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=tines
pkgver=1.10
pkgrel=1
pkgdesc="A hierarchical console-based outliner/planner/notebook and fork of HNB."
arch=('i686' 'x86_64')
url="https://github.com/larrykollar/tines"
license=("GPL2")
depends=('ncurses')
source=("https://github.com/larrykollar/tines/archive/v$pkgver.tar.gz")
md5sums=('5b08524b46de2f034fe52bf69b40c7b2')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|^MANDIR=.*$|MANDIR=/usr/share/man|' Makefile
  # no PREFIX support
  sed -i 's|/local/|/|' Makefile
  # no DESTDIR support
  sed -i "s|DIR=|&$pkgdir|" Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}
