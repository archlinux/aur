# $Id$
# Maintainer: Burke Cates <burke.cates+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Ben Mazer <blm@groknil.org>
# Contributor: Mike Douglas <code_monkey@gooeylinux.org>

_pkgname=gtypist
pkgname=gtypist-single-space
pkgver=2.9.5
pkgrel=3
_overlay_hash=f3b67b6d229a1d8c7bf0b3151eba51a885a25185
pkgdesc="universal typing tutor with single spaces after sentences in lessons."
arch=('i686' 'x86_64')
url="https://github.com/inaimathi/gtypist-single-space"
license=("GPL")
depends=('ncurses' 'perl')
makedepends=('emacs')
conflicts=('gtypist')
provides=('gtypist')
source=(ftp://ftp.gnu.org/gnu/gtypist/$_pkgname-$pkgver.tar.gz
	https://github.com/inaimathi/gtypist-single-space/archive/$_overlay_hash.zip
	ncurses.patch)
md5sums=('6098c32890f2437384b5efe4e993fb32'
         '492c92eb0917ec3b39567c2a9cb87514'
         'a836141e70941b7e0d3477bc8ecdecdf')

prepare() {
  cd "$srcdir"/$_pkgname-$pkgver
  patch -p1 <"$srcdir"/ncurses.patch
  autoreconf
  mv "$srcdir"/"$pkgname"-"$_overlay_hash"/*.typ "$srcdir"/"$_pkgname"-"$pkgver"/lessons/
}

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  make prefix="$pkgdir"/usr install
  rm -f "$pkgdir"/usr/share/info/dir
}
