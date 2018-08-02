#Maintainer: erroneous AT gmail
pkgname=xlnt
pkgver=1.3.0
pkgrel=1
pkgdesc="Cross-platform user-friendly xlsx library for C++14"
url="https://github.com/tfussell/xlnt"
license=(MIT)
makedepends=('cmake>=3.2.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4430e3821b8fd522e8b2bd02e8cd0367a5c74c02655ef8912e423dfac6d0225b')

arch=('i686' 'x86_64')
depends=()

prepare(){
	rm -Rf build
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DTESTS=OFF \
		../${pkgname}-${pkgver}
}

build(){
	make -C build
}
package(){
	make -C build DESTDIR="$pkgdir" install
	install -Dm644 "${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/xlnt/LICENSE.md"
}
