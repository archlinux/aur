# Maintainer: Ignacio Losiggio <iglosiggio@dc.uba.ar>
pkgname=ldpl
pkgver=4.4
pkgrel=1
pkgdesc="COBOL inspired language, designed to be expressive, fast, readable and easy to learn."
arch=('x86_64')
url="https://www.ldpl-lang.org/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('awk')
source=("https://github.com/Lartu/$pkgname/archive/$pkgver.tar.gz"
        "dont-do-mandb.patch" "lpm-flags.patch")
md5sums=('13fa289ccd761a36702fe37b51f90378'
         '97bd2394689ba8c4c161edde2317eefd'
         'c4cb95cca6596d629299ac58e0d0e551')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/dont-do-mandb.patch"
	patch -p1 -i "$srcdir/lpm-flags.patch"
}

build() {
	cd "$pkgname-$pkgver/src"
	make LFLAGS="$LDFLAGS" LPMFLAGS="$CXXFLAGS $LDFLAGS"
}

package() {
	cd "$pkgname-$pkgver/src"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
