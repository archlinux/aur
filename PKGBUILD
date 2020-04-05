# Maintainer: Krystian Chachula <krystiancha@gmail.com>
pkgname=raspicam-git
pkgver=r58.651c564
pkgrel=1
pkgdesc="C++ API for using Raspberry camera (with OpenCV)"
arch=('any')
url="http://www.uco.es/investiga/grupos/ava/node/40"
license=('BSD')
groups=()
depends=('cmake')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('raspicam::git+https://github.com/cedricve/raspicam.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
	cd build
	cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cd build
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd build
	make install
}
