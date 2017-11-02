#Maintainer: erroneous AT gmail
pkgname=xlnt
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross-platform user-friendly xlsx library for C++14"
url="https://github.com/tfussell/xlnt"
license=(MIT)
makedepends=('cmake>=3.2.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz" fix_miniz.patch)
sha256sums=('b2be158dbf3899b38e8fa28726b366cf8817599425fb1945d6a01d8a88d457fe'
            '2f44baef580af7ef17a0522b2a0f694477510f8848f375ad5497d7a5ede126f2')
arch=('i686' 'x86_64')
depends=()

prepare(){
	cd ${pkgname}-${pkgver}
	patch -p1 < ../fix_miniz.patch
	cd ..
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
