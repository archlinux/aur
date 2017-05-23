# Maintainer: Bryce Chidester <bryce@cobryce.com>
pkgname=purple-matrix-git
pkgver=r113.aa005c1
pkgrel=1
pkgdesc="Libpurple protocol plugin for matrix."
arch=('any')
url="https://github.com/matrix-org/purple-matrix"
license=('GPL2')
depends=('libpurple' 'http-parser' 'glib2' 'json-glib')
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
