# Maintainer: baitmooth <baitmooth@gmail.com>
# Contributor: Brian White <bcwhite@pobox.com>
pkgname=scribble
pkgver=1.11_1
pkgrel=1
pkgdesc="console based scrabble like game"
arch=(any)
url="https://sources.debian.net/src/scribble/1.11-1/"
license=('GPL3')
depends=(perl)
source=("git+https://github.com/baitmooth/scribble.git")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/dict
	mkdir -p $pkgdir/usr/share/man/man6
	cp $srcdir/$pkgname/scribble $pkgdir/usr/bin/
	$pkgdir/usr/bin/scribble --filter-words $srcdir/$pkgname/word-frequencies $srcdir/$pkgname/wordlists/* >$pkgdir/usr/share/dict/scribble-english
	cat "wordlists/ZZ - Deleted Words.txt" >>$pkgdir/usr/share/dict/scribble-english
	chmod 644 $pkgdir/usr/share/dict/scribble-english
	pod2man "$srcdir"/"$pkgname"/scribble >$pkgdir/usr/share/man/man6/scribble.6
	chmod 644 $pkgdir/usr/share/man/man6/scribble.6
}
