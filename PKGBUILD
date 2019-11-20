# Maintainer: Matthias Blankertz <matthias at blankertz dot org>
pkgname=msc-generator
pkgver=6.3.5
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
sha256sums=('8a715e91b3630c61885b977dd50f18068643cbf1cb824f1a70ddffdbed2aa39b')

build() {
	cd "$srcdir/$pkgname-$pkgver"

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
	cd "$srcdir/$pkgname-$pkgver"
	make check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
