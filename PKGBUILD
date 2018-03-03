# Maintainer: aksr <aksr at t-com dot me>
pkgname=uno
pkgver=2.14
pkgrel=1
pkgdesc="A simple tool for source code analysis, for ANSI-C programs."
arch=('i686' 'x86_64')
url="http://spinroot.com/uno/"
license=('custom')
source=("http://www.spinroot.com/uno/${pkgname}_v${pkgver//./}.tar.gz")
md5sums=('c393358e9c12438f776aa2da7d8b7ec3')
sha1sums=('5da48c5d02c5b8c77bfb40c49b783652dab64a33')
sha256sums=('a3b897350988e94a9727babe6b794b67b558f18b0766bbcb344e8db30b0fe5d3')

build() {
  cd "$srcdir/$pkgname/src"
  make
}

package() {
  cd "$srcdir/$pkgname/src"
  mkdir -p $pkgdir/usr/{bin,share/{doc/$pkgname,man/man1}}
  make BINDIR="$pkgdir/usr/bin" install
  install -Dm644 ../doc/uno.1 $pkgdir/usr/share/man/man1/
  install -Dm644 ../doc/uno_long.pdf $pkgdir/usr/share/doc/$pkgname/uno_long.pdf
  install -Dm644 ../doc/uno_short.pdf $pkgdir/usr/share/doc/$pkgname/uno_short.pdf
  install -Dm644 ../doc/uno_man.pdf $pkgdir/usr/share/doc/$pkgname/uno_man.pdf
  install -Dm644 ../doc/uno_manpage.pdf $pkgdir/usr/share/doc/$pkgname/uno_manpage.pdf
  sed '3,9!d' uno.c > COPYING
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

