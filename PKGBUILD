# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=clipboard
_pkgname=Clipboard
pkgver=0.1.2R1
pkgrel=3
pkgdesc="Cut, copy, and paste anything in your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cd48aa825efd35a54d57573761595e10b5d676f9eda806b6c6b1774d5ac3c015')

build () {
	cmake -B build -S "${_pkgname}-${pkgver}/src" \
	-DCMAKE_BUILD_TYPE='None' \
	-DCMAKE_INSTALL_PREFIX='/usr' \
	-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	ln -sf "${pkgdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/cb"
}
