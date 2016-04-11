# Maintainer: Matthias Blankertz <matthias at blankertz dot org>
pkgname=msc-generator
pkgver=5.1.0
pkgrel=1
epoch=
pkgdesc="Draws MSCs from textual descriptions"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/msc-generator/"
license=('AGPL3')
groups=()
depends=('graphviz>=2.36')
makedepends=(help2man texlive-plainextra)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=msc-generator.install
changelog=

source=("http://sourceforge.net/projects/msc-generator/files/msc-generator/v5.1/msc-generator-5.1.tar.gz")
noextract=()
sha256sums=('e908a325c822bfc6284dfba64cb26a1d580c6382c9c4932d8bfc8de35f726ecf')

build() {
	cd "$srcdir/$pkgname-5.1"

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
	cd "$srcdir/$pkgname-5.1"
	make check
}

package() {
	cd "$srcdir/$pkgname-5.1"
	make DESTDIR="$pkgdir/" install
}
