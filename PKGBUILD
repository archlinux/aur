# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=teem
pkgver=1.11.0
pkgrel=2
pkgdesc='A coordinated group of libraries for representing, processing, and visualizing scientific raster data.'
arch=('x86_64')
url='http://teem.sourceforge.net/index.html'
license=('LGPL')
depends=()
optdepends=()
makedepends=('cmake')
source=("https://sourceforge.net/projects/teem/files/teem/${pkgver}/teem-${pkgver}-src.tar.gz/download")
sha512sums=('48b171a12db0f02dcfdaa87aa84464c651d661fa66201dc966b3cd5a8134c5bad1dad8987ffcc5d7c21c5d14c2eb617d48200410a1bda19008ef743c093ed575')

prepare() {
	cd "$srcdir/$pkgname-$pkgver-src"

	mkdir build || :
	cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DBUILD_SHARED_LIBS:BOOL=ON \
		..
}

build() {
    cd "$srcdir/$pkgname-$pkgver-src/build"
	make
}

package() {
    cd "$srcdir/$pkgname-$pkgver-src/build"
	make install DESTDIR="$pkgdir"

	install -D -m644 \
		"${srcdir}/$pkgname-$pkgver-src/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

