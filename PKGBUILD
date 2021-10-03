# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=torchvision
pkgdesc='datasets, transforms, and models specific to computer vision (C++ library only)'
pkgver=0.10.1
pkgrel=1
license=("BSD")
url='https://github.com/pytorch/vision'
arch=('x86_64')

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/pytorch/vision/archive/v$pkgver.tar.gz"
)

sha512sums=('ad254d855259ff6ca9140f8dc85061e7223c21fbdf383483b16ee73576c22bb35bd558de4cfb048926d31b74a71dcfe806805d2f8c48757f1fdb6bedd8237cf9')

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
