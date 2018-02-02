# Maintainer: Vojtech Aschenbrenner <v@asch.cz>

pkgname=lsdn-git
pkgver=r381.ed2f0ee
pkgrel=1
pkgdesc="Tool for software defined networking on top of TC"
arch=('any')
url="https://github.com/asch/lsdn"
license=('unknown')
groups=()
depends=('tcl' 'linux>=4.14' 'uthash' 'libmnl' 'json-c' 'libdaemon' 'libvirt')
makedepends=('git' 'cmake' 'linux>=4.14')
optdepends=()
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
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/$pkgdir/usr ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make install
}
