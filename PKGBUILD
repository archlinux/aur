# Mantainer: Fabrizio Pietrucci <bamlessnty5@gmail.com>

pkgname=jstar
pkgver=1.4
pkgrel=0
pkgdesc="A Lightweight Embeddable Scripting Language"
arch=('i686' 'x86_64')
url="https://github.com/jstar-lang/jstar"
license=('MIT')
makedepends=('cmake>=3.9' 'python>=2.7')

source=("${pkgname}-${pkgver}::https://github.com/jstar-lang/jstar/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/jstar-lang/jstar/master/LICENSE")

sha256sums=("f8d7e3242315683ad45a1c76a356eaa65633771bbc1b9a1509e07785581766ee"
            "SKIP")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	git init	
	git remote add origin https://github.com/bamless/jstar.git
	git checkout v${pkgver}
	git submodule update --init

	mkdir -p build && cd build
	
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ../
	make -j
}

package() {
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make install
}
