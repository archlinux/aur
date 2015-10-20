# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=libgpuarray-git
pkgver=r1226.2d21cc2
pkgrel=1
pkgdesc="Library to manipulate tensors on the GPU"
arch=('any')
url="https://github.com/Theano/libgpuarray"
license=('MIT')
depends=()
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Theano/libgpuarray.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	rm -rf Build
	mkdir Build
	cd Build
	cmake .. -DCMAKE_BUILD_TYPE=Release "-DCMAKE_INSTALL_PREFIX=$pkgdir/usr"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cd Build
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd Build
	make install
}
