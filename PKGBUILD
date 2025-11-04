# Maintainer: SummerBreeze630 <xzwf2003 AT 163 DOT com>

pkgname=wizstr
pkgver=2025.10.1
pkgrel=1
pkgdesc="C++ string processing library"
arch=('x86_64' 'aarch64')
url="https://github.com/libbylg/str"
license=('MulanPSL-2.0')
depends=('gcc-libs')
makedepends=('cmake')
conflicts=("libstr-git")
_srcdir="${pkgname}-${pkgver}"
source=("${_srcdir}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6ed6504d211670b5638a598298b825f6537ae40969b5fcb887b0e6e575bbe1ad')
options=('staticlibs')

build() {
	mkdir -p build

	cmake -B build \
		-S "${_srcdir}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release

	cmake --build build \
		-j $(nproc)
}

package() {
	DESTDIR="${pkgdir}" \
		cmake --build build \
		--target install

	install -Dm644 "${_srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
