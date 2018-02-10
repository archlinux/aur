# Maintainer: Vojtech Aschenbrenner <v@asch.cz>

pkgname=lsdn-git
pkgver=r438.14e8230
pkgrel=1
pkgdesc="Tool for software defined networking on top of TC"
arch=('any')
url="https://github.com/asch/lsdn"
license=('GPL2')
groups=()
depends=('tcl>=8.6.0' 'linux>=4.14' 'uthash' 'libmnl' 'json-c' 'libdaemon')
makedepends=('git' 'cmake' 'linux>=4.14')
optdepends=('libvirt')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/asch/lsdn')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR='/usr/lib' \
		-DCMAKE_SKIP_RPATH='TRUE'
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
