# Maintainer: aksr <aksr at t-com dot me>
pkgname=new-e
_pkgname=ne
pkgver=3.21
pkgrel=1
pkgdesc='A text editor that can process files as single-byte characters, as UTF-8 multibyte characters, or as binary bytes, runs as an interactive screen editor, but it can also run as a line-by-line editor, interactively or driven by a script'
arch=('i686' 'x86_64')
url='http://quercite.dx.am/'
license=('GPL')
depends=('ncurses' 'pcre2')
source=("https://github.com/PhilipHazel/$_pkgname/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('a13e84b6fc2fc32ee82a1a613a090981')
sha1sums=('e76f7227fc0c9b1acc8e38c6bd98b6c5b3fc27ea')
sha256sums=('d1f49c5f1491ed8eadff5a316da7e172833086b58b6d221400e05a58a0755f20')
sha512sums=('d11a1d0d29593a8033741cb378896b7333a2bac5510960e21c126a87a3a9b3895b8668219e9c65ade4c0d02c8581707683292d3ebe52818171c37468f421a08b')
b2sums=('397960792cff41318c50a56d1cb9db5a817eb83f0ecd8e1a99cb7d48b7674142944ee446839bf7a64afa6d0f5c137a158c6c2c8ff1993e9c22d4dbf20a23439f')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	./configure
	sed -i 's!src/ne $(BINDIR)/ne!src/ne $(BINDIR)/new-e!' Makefile
	sed -i 's!ne.1 $(MANDIR)/man1!ne.1 $(MANDIR)/man1/new-e.1!' Makefile
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	make
}

check() {
	cd "$srcdir/$_pkgname-$pkgver/test"
	./RunTests
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" install
	install -D -m644 doc/ne.pdf $pkgdir/usr/share/doc/$pkgname/new-e.pdf
}
