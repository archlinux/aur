# Maintainer: Timo S. Prinz <t.prinz@coliza.de>
# Contributor: Dan Nixon <dan@dan-nixon.com>
pkgname=libgpredict-git
pkgver=r21.c8d0d28
pkgrel=1
pkgdesc="An attempt to take the prediction code out of Gpredict and make it a standalone dynamic library"
arch=('x86_64' 'i686')
url="https://github.com/cubehub/libgpredict"
license=('NONE')
depends=('glib2')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('libgpredict::git+https://github.com/cubehub/libgpredict.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
	cd build
	cmake ../ -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make install
}
