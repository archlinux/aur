# Mantainer: Fabrizio Pietrucci <bamlessnty5@gmail.com>

pkgname=jstar
pkgver=1.4.2
pkgrel=1
pkgdesc="A Lightweight Embeddable Scripting Language"
arch=('i686' 'x86_64')
url="https://github.com/bamless/jstar"
license=('MIT')
makedepends=('cmake>=3.9' 'python>=2.7')

source=("${pkgname}-${pkgver}::git://github.com/bamless/jstar.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname}-${pkgver}"
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	mkdir -p build && cd build
	
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ../
	make -j
}

package() {
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make install
}
