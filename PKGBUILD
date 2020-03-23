#Maintainer: erroneous AT gmail
pkgname=xlnt
pkgver=1.5.0
pkgrel=1
pkgdesc="Cross-platform user-friendly xlsx library for C++14"
url="https://github.com/tfussell/xlnt"
license=(MIT)
makedepends=('cmake>=3.2.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8dec266d59ab6e4829da5dacea764a02887eeff5a5501c9a51ce796e735b90de')

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
