# Maintainer: Benjamin Davies <bentendavies at gmail dot com>
pkgname=mb-git
pkgver=r27.0f5ecfa
pkgrel=1
pkgdesc=""
arch=(any)
url=""
license=('GPL')
groups=()
depends=('boost-libs')
makedepends=('boost' 'cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('mb::git+https://github.com/Benjamin-Davies/mb.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	mkdir -p build/
}

build() {
	cd "$srcdir/${pkgname%-git}"

	cd build/
	cmake -G "Unix Makefiles" .. \
		-DCMAKE_INSTALL_PREFIX=/usr

	make
}

check() {
	cd "$srcdir/${pkgname%-git}"

	cd build/
	test -f mb
}

package() {
	cd "$srcdir/${pkgname%-git}"

	cd build/
	make DESTDIR="$pkgdir/" install
}
