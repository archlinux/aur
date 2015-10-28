# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=libyang-devel-git
_gitname=libyang
pkgver=r1015.9ac51e0
pkgrel=1
pkgdesc='libyang is YANG data modelling language parser and toolkit written (and providing API) in C'
url='https://github.com/CESNET/libyang/'
arch=('i686' 'x86_64' 'armv7h')
license=('ISC BSD-3c')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config')
conflicts=('libyang' 'libyang-git')
provides=('libyang')
source=('git+https://github.com/CESNET/libyang.git#branch=devel')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr

	make
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
}
