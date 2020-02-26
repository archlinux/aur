#Maintainer: erroneous AT gmail
pkgname=xlnt
pkgver=1.4.0
pkgrel=2
pkgdesc="Cross-platform user-friendly xlsx library for C++14"
url="https://github.com/tfussell/xlnt"
license=(MIT)
makedepends=('cmake>=3.2.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('936beebf38a74662b8d7aba014eb6e02304532653a2b28a7b52a3d9162a1abb8')

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
