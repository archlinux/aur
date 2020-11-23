# Mantainer: Fabrizio Pietrucci <bamlessnty5@gmail.com>

pkgname=jstar
pkgver=1.3.2
pkgrel=3
pkgdesc="A Lightweight Embeddable Scripting Language"
arch=('i686' 'x86_64')
url="https://github.com/jstar-lang/jstar"
license=('MIT')
makedepends=('cmake>=3.9' 'python>=2.7')

source=("${pkgname}-${pkgver}::https://github.com/jstar-lang/jstar/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/jstar-lang/jstar/master/LICENSE")

sha256sums=("0326d33ca5959e045d4c4e29de125c75df6d3a7c93de0d465fed13aafd66993e"
            "SKIP")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build && cd build
	
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ../
	make -j
}

package() {
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make install
}
