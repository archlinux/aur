# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=dbow2
pkgname=${_name}-openvslam-git
pkgver=r39.adff102
pkgrel=1
pkgdesc="Enhanced hierarchical bag-of-word library for C++ (modified to read/write in binary format)"
arch=('x86_64')
url="https://github.com/shinsumicco/DBoW2"
license=('custom')
depends=(
	'opencv'
)
makedepends=(
	'cmake'
	'git'
)
provides=('dbow2')
conflicts=(
	'dbow2-free'
	'dbow2-git'
)
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_name}"
	[ ! -d build ] || rm -rf build
	mkdir -p build && cd build
	cmake .. \
		-DBUILD_Demo=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr
}

build() {
	cd "${_name}/build"
	make
}

package() {
	cd "${_name}/build"
	make DESTDIR="$pkgdir/" install
}
