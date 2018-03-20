# Maintainer: Nicholas Cioli <nicholascioli+arch@gmail.com>
pkgname=dloopdetector-free
pkgver=1.1
pkgrel=1
pkgdesc="Fast loop detector for sequences of monocular images. No SURF support"
arch=('x86_64')
url="https://github.com/dorian3d/DLoopDetector"
license=('custom')
depends=(dlib-free)
makedepends=(cmake boost gcc)
provides=()
conflicts=(dloopdetector-nonfree)
source=(
	"https://github.com/dorian3d/DLoopDetector/archive/v$pkgver-free.tar.gz"
)
md5sums=(
	"cf31ccd487503da36f7320dbb15a6513"
)

build() {
	cd "DLoopDetector-$pkgver-free"
	if [ ! -d build ]; then
		mkdir build
	fi
	cd build
	cmake .. \
		-DBUILD_DemoBRIEF=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "DLoopDetector-$pkgver-free/build"
	make DESTDIR="$pkgdir/" install

	# Install the license
	install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
