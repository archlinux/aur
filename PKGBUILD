# Maintainer: Nicholas Cioli <nicholascioli+arch@gmail.com>
pkgname=dbow2-free
pkgver=1.1
pkgrel=1
pkgdesc="Enhanced hierarchical bag-of-word library for C++. No support for non-free features"
arch=('x86_64')
url="https://github.com/dorian3d/DBoW2"
license=('custom')
depends=(dlib-free)
makedepends=(cmake gcc)
provides=()
conflicts=(dbow2-nonfree)
source=(
	"https://github.com/dorian3d/DBoW2/archive/v$pkgver-free.tar.gz"
)
md5sums=(
	"2764979e5be6bc7a7f041892d6527af4"
)

build() {
	cd "DBoW2-$pkgver-free"
	if [ ! -d build ]; then
		mkdir build
	fi
	cd build
	cmake .. \
		-DBUILD_Demo=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "DBoW2-$pkgver-free/build"
	make DESTDIR="$pkgdir/" install

	# Install the license
	install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
