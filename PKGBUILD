# Maintainer: Vojtech Aschenbrenner <v@asch.cz>

pkgname=lsdn-git
pkgver=r437.5970e38
pkgrel=1
pkgdesc="Tool for software defined networking on top of TC"
arch=('any')
url="https://github.com/asch/lsdn"
license=('unknown')
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
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
