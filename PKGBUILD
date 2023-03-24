# Maintainer: aksr <aksr at t-com dot me>
pkgname=dpic-git
pkgver=r48.1e982f5
pkgrel=1
pkgdesc='An implementation of the pic "little language," with support for LaTeX, PDF, SVG, Postscript, and xfig 3.2 output.'
arch=('i686' 'x86_64')
url="https://gitlab.com/aplevich/dpic.git"
url="https://ece.uwaterloo.ca/~aplevich/dpic/"
license=('custom: BSD')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+https://gitlab.com/aplevich/dpic.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/usr" install
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
	install -D -m644 Copyright.txt $pkgdir/usr/share/licenses/${pkgname%-*}/Copyright
}
