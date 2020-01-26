# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wiggle
pkgver=1.2
pkgrel=1
pkgdesc="A program for applying patches that patch cannot apply because of conflicting changes"
arch=('i686' 'x86_64')
depends=('ncurses')
url="https://github.com/neilbrown/wiggle"
license=('GPL2')
source=(https://neil.brown.name/wiggle/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Building with -Wall -Werror fails. Respect CFLAGS from /etc/makepkg.conf
  sed -i -r 's/^CFLAGS=.*/CFLAGS+=-I. /' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

sha256sums=('31375badb76a4a586f2113e49d13486dbc64844962ae80976a81c6542e901622')
