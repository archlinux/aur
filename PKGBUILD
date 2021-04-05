# Maintainer: aksr <aksr at t-com dot me>
pkgname=wordtsar-hg
pkgver=232
pkgrel=1
pkgdesc='A Wordstar 7.0D document mode clone. It loads Wordstar 4, Wordstar 7, and RTF (partial) files, and saves in Wordstar 7 and RTF format.'
arch=('i686' 'x86_64')
url='http://wordtsar.ca/'
license=('AGPL3')
depends=('qt5-base')
makedepends=('mercurial')
conflicts=("${pkgname%-*}")
source=("$pkgname::hg+http://hg.code.sf.net/p/wordtsar/mercurial")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	hg identify -n | sed 's/+//'
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's!\.\./!!g' wordtsar.pro
}

build() {
	cd "$srcdir/$pkgname"
	qmake-qt5 wordtsar.pro
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 WordTsar $pkgdir/usr/bin/WordTsar
	install -D -m644 LICENSE.md $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE.md
}
