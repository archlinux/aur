# Contributor: xduugu
# Maintainer: aksr <aksr at t-com dot me>
pkgname=diff-pdf-git
pkgver=0.4.1.r3.0e893a8
pkgrel=1
pkgdesc="A simple tool for visually comparing two PDF files"
arch=('i686' 'x86_64')
url="http://vslavik.github.io/diff-pdf"
license=('GPL')
depends=('poppler-glib' 'wxgtk2')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+https://github.com/vslavik/diff-pdf.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	cd "$srcdir/${pkgname%-*}"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="$pkgdir/" install
}
