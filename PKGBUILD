# Maintainer: Ignacio Losiggio <iglosiggio@dc.uba.ar>
pkgname=ldpl
pkgver=3.0.5
pkgrel=1
pkgdesc="COBOL inspired language, designed to be expressive, fast, readable and easy to learn."
arch=('x86_64')
url="https://www.ldpl-lang.org/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('awk')
source=("https://github.com/Lartu/$pkgname/archive/$pkgver.tar.gz"
        "dont-do-mandb.patch")
md5sums=('3d60f6535919e79b736da0fa2a69bcc9' 'dc344057eee2032c7b49562b507db99a')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/dont-do-mandb.patch"
}

build() {
	cd "$pkgname-$pkgver/src"
	make LFLAGS="$LDFLAGS"
}

package() {
	cd "$pkgname-$pkgver/src"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
