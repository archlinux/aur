# Maintainer: Tobias Hänel <aur@tobias-haenel.de>
_pkgname=boost-multi
pkgname=$_pkgname-git
pkgver=0.83.0.r170.gf1b04da
pkgrel=1
pkgdesc="Multidimensional array access to contiguous or regularly contiguous memory. (Not an official Boost library)"
arch=(any)
url="https://gitlab.com/correaa/boost-multi"
license=(Boost)
#depends=()
makedepends=(git cmake ninja)
checkdepends=(boost)
#optdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
_build_dir=build
_proj_dir=$_pkgname
source=("$_proj_dir::git+https://gitlab.com/correaa/boost-multi.git")
sha512sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B $_build_dir \
		-S "$_proj_dir" \
		-G Ninja \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build $_build_dir
}

check() {
	ctest --test-dir $_build_dir --output-on-failure
}

package() {
	DESTDIR="$pkgdir/" cmake --install $_build_dir
}
