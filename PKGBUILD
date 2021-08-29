# Maintainer: Benjamin Davies <bentendavies at gmail dot com>
pkgname=mb-git
pkgver=r29.a8f0e14
pkgrel=1
pkgdesc="a simple mailbox utility"
arch=(any)
url="https://github.com/Benjamin-Davies/${pkgname%-git}"
license=('GPL')
groups=()
depends=('boost-libs')
makedepends=('boost' 'cmake' 'git')
optdepends=('mbsync: synchonize mail')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("mb::git+$url.git")
noextract=()
md5sums=('SKIP')

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
	test -x mb
}

package() {
	cd "$srcdir/${pkgname%-git}"

	cd build/
	make DESTDIR="$pkgdir/" install
}
