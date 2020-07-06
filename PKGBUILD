# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=torchvision
pkgdesc='datasets, transforms, and models specific to computer vision (C++ library only)'
pkgver=0.6.1
pkgrel=1
license=("BSD")
url='https://github.com/pytorch/vision'
arch=('x86_64')

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/pytorch/vision/archive/v$pkgver.tar.gz"
)

sha512sums=('428235ae9412d176dc62eb42ed926caa5199bab448e7798fa240d69c1337e1ca5423c45a34bd6f4527e7ccafb927f53743311f8701dcee5f168bacc60f1d6750')

depends=(
	python
	python-pytorch
)

makedepends=(
	cmake
)

prepare() {
	rm -rf build
	mkdir build
	cd build
	cmake "../vision-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS} -O3" \
		-DWITH_CUDA=OFF
}

build() {
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "vision-$pkgver/LICENSE"
}
