# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=qmicroz
pkgver=0.6
pkgrel=1
pkgdesc="Minimalist Zip/Unzip library. C++/Qt wrapper over miniz."
arch=('x86_64')
url="https://github.com/artemvlas/qmicroz"
license=('MIT')
depends=('qt6-base')
makedepends=('cmake')

source=(https://github.com/artemvlas/qmicroz/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(e5257057b055340500ac5a2cee5c6198f54796f3235ad19256bfd6fd61c58b3b)

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON
	make -j2
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd build
	make install DESTDIR="${pkgdir}"
}
