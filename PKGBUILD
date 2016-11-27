# Maintainer: Monika Schrenk <moni@random-access.org>

# Read http://thelinuxrain.com/articles/memo-note-taking-unix-style
# for some tips on how to use this.

pkgname=memo-notes
pkgver=1.6
pkgrel=4
pkgdesc="memo: A CLI note taking application."
arch=('i686' 'x86_64')
url="http://www.getmemo.org/"
license=('custom')
makedepends=('git')
source=("$pkgname::git+https://git-ssb.celehner.com/%25Ruk8qeLktKmQuSjVXW%2FZOR2PbnfsYt4B5WA0yxrK%2BrE%3D.sha256#tag=v$pkgver")

sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  sed -i -e '/^override/d' \
         -e 's/^\(PREFIX=\/usr\)\/local/\1/' \
         -e '/^LDFLAGS=/d' \
    Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package () {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/usr/share/doc/"$pkgname"
  #mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"

  install -m755 "$srcdir/$pkgname"/memo "$pkgdir"/usr/bin
  install -m644 "$srcdir/$pkgname"/memo.1 "$pkgdir"/usr/share/man/man1
  install -m644 "$srcdir/$pkgname"/README "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$pkgname"/NEWS "$pkgdir"/usr/share/doc/"$pkgname"
}
