# Maintainer: redfish <redfish@galactica.pw>

pkgname=randomx
_name=RandomX
pkgver=1.1.7
pkgrel=1
pkgdesc="RandomX: The proof of work algorithm based on random code execution"
arch=('x86_64')
url="https://github.com/tevador/RandomX"
license=('BSD')
makedepends=('cmake')
source=("https://github.com/tevador/RandomX/archive/v${pkgver}.tar.gz")

_blddir=build

build() {
	cd "$srcdir/${_name}-${pkgver}"
	mkdir ${_blddir}
	cd ${_blddir}
	cmake ..
	make
}

check() {
	cd "$srcdir/${_name}-${pkgver}/${_blddir}"
	./randomx-tests
}

package() {
	cd "$srcdir/${_name}-${pkgver}/${_blddir}"
	make DESTDIR="$pkgdir/" install
	install -Dm755 "randomx-benchmark" "${pkgdir}/usr/bin/randomx-benchmark"
	install -Dm755 "randomx-codegen" "${pkgdir}/usr/bin/randomx-codegen"
}

sha256sums=('31741ede58267c84c1223370a4d18e32fad26a9652371d36da7e45c0c584ae1a')
