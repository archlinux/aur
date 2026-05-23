# Maintainer: Rémi Labelle <remilabelle at outlook dot com>

pkgname=vtzero
pkgver=1.2.0
pkgrel=1
pkgdesc="Minimalist vector tile decoder and encoder in C++"
arch=('any')
url="https://github.com/mapbox/${pkgname}"
license=('BSD-2-Clause')
depends=()
makedepends=(
	boost
	cmake
	protozero
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

b2sums=('5406b80b0da245d6163d675d4b4291226cfc446df93e9c9fd7af948c29b25fe9c0c64ad7d0db30cf9fbf001ff68f741d9b1fbe819b437d7129a2332440f9a308')

build() {
	local cmake_options=(
		-B build
		-S "${srcdir}/${pkgname}-${pkgver}"
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)
	cmake "${cmake_options[@]}"
}

package() {
	DESTDIR="${pkgdir}/" cmake --install build

	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
