# Maintainer: Nicholas Cioli <nicholascioli+arch@gmail.com>
pkgname=dlib-free
pkgver=1.1
pkgrel=1
pkgdesc="C++ library with several utilities. No support for non-free features"
arch=('x86_64')
url="https://github.com/dorian3d/DLib"
license=('custom')
depends=(opencv)
makedepends=(cmake gcc)
provides=()
conflicts=(dlib-nonfree)
source=(
	"https://github.com/dorian3d/DLib/archive/v$pkgver-free.tar.gz"
)
md5sums=(
	"808b3aa44eb781012892f6aaa403c3ff"
)

build() {
	cd "DLib-$pkgver-free"
	if [ ! -d build ]; then
		mkdir build
	fi
	cd build
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "DLib-$pkgver-free/build"
	make DESTDIR="$pkgdir/" install

	# Install the license
	install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
