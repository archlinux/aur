# Maintainer: aksr <aksr at t-com dot me>
pkgname=dpic-git
pkgver=r52.1354b63
pkgrel=1
pkgdesc='An implementation of the pic, with support for LaTeX, PDF, SVG, Postscript, and xfig 3.2 output.'
arch=('i686' 'x86_64')
url='https://ece.uwaterloo.ca/~aplevich/dpic/'
license=('custom: BSD-2-Clause')
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
	install -D -m644 dpic-doc.pdf $pkgdir/usr/share/doc/${pkgname%-*}/dpic-doc.pdf
	install -D -m644 Copyright.txt $pkgdir/usr/share/licenses/${pkgname%-*}/Copyright
}
