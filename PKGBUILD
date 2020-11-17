# Maintainer: aksr <aksr at t-com dot me>
pkgname=ccut-git
pkgver=2.3.r21.gea48c4d
pkgrel=1
pkgdesc="A unix cut command that supports: multiple delimiters, outputing fields in any specified order, outputing a different delimiter to the ones in the input, treating runs of delimiters as a single delimiter, and honoring quoting within the target document."
arch=('i686' 'x86_64')
url="https://github.com/ColumPaget/ColumsCut"
license=('GPL3')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="usr" install
	install -D -m644 LICENCE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
