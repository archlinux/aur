# Maintainer:
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Ben Mazer <blm@groknil.org>
# Contributor: Mike Douglas <code_monkey@gooeylinux.org>

pkgname=gtypist
pkgver=2.9.5
pkgrel=5
pkgdesc="universal typing tutor"
arch=('x86_64')
url="http://www.gnu.org/software/gtypist/gtypist.html"
license=("GPL")
depends=('ncurses' 'perl')
makedepends=('emacs')
source=(ftp://ftp.gnu.org/gnu/gtypist/$pkgname-$pkgver.tar.gz
	ncurses.patch)
md5sums=('6098c32890f2437384b5efe4e993fb32'
         'a836141e70941b7e0d3477bc8ecdecdf')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 <"$srcdir"/ncurses.patch
  autoreconf
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make prefix="$pkgdir"/usr install
  rm -f "$pkgdir"/usr/share/info/dir
}
