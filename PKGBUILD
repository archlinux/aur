# Maintainer: Matthias Blankertz <matthias at blankertz dot org>
pkgname=msc-generator
pkgver=5.3.1
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
install=
changelog=

source=("http://sourceforge.net/projects/msc-generator/files/msc-generator/v5.3/msc-generator-v$pkgver.tar.gz")
noextract=()
sha256sums=('9257ddd5e2806ae8eb8127166ac7351bc629d66d8e1e15b5f66b6bfb32fe780a')

build() {
	cd "$srcdir/$pkgname-v$pkgver"

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
	cd "$srcdir/$pkgname-v$pkgver"
	make check
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" install
}
