# Maintainer: Matthias Blankertz <matthias at blankertz dot org>
pkgname=msc-generator
pkgver=6.1
pkgrel=1
epoch=
pkgdesc="Draws MSCs from textual descriptions"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/msc-generator/"
license=('AGPL3')
groups=()
depends=('graphviz>=2.36' glpk)
makedepends=(help2man texlive-plainextra)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("http://sourceforge.net/projects/msc-generator/files/msc-generator/v6.x/msc-generator-$pkgver.tar.gz")
noextract=()
sha256sums=('871b07ab574c8a6d13fa733c7e8419139a63e427d4d8110756727fad4becf1cb')

build() {
	cd "$srcdir/$pkgname-$pkgver.0"

	# Remove links
	rm compile depcomp doc/texinfo.tex doc/mdate-sh install-sh missing
	# Remove stale configure script
	rm configure

	aclocal
	automake -a
	autoconf
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver.0"
	make check
}

package() {
	cd "$srcdir/$pkgname-$pkgver.0"
	make DESTDIR="$pkgdir/" install
}
