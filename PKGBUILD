# Maintainer: Christoph Seitz <christoph.seitz@posteo.de>
pkgname=purple-matrix-git
pkgver=r61.9e21bf2
pkgrel=1
pkgdesc="Libpurple protocol plugin for matrix."
arch=('x86' 'x86_64')
url="https://github.com/matrix-org/purple-matrix"
license=('GPL')
depends=('libpurple')
makedepends=('git')
provides=('purple-matrix')
conflicts=('purple-matrix')
source=('git+https://github.com/matrix-org/purple-matrix.git')
md5sums=('SKIP')

CPPFLAGS="$CPPFLAGS -O2"

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}


package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR=$pkgdir install
}
