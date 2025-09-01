# Maintainer: SummerBreeze630 <xzwf2003 AT 163 DOT com>

pkgname=wizstr
pkgver=2025.8.2
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
sha256sums=('400901c80a2803d934e524b2d9896732956a79e6cbda7f208eded4b90d372cd3')
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
