# Maintainer: SummerBreeze630 <xzwf2003 AT 163 DOT com>

pkgname=wizstr
_archivever=2026.1.2
pkgver=2026.1.3
pkgrel=1
pkgdesc="C++ string processing library"
arch=('x86_64' 'aarch64')
url="https://gitee.com/libbylg/str"
license=('MulanPSL-2.0')
depends=('gcc-libs')
makedepends=('cmake')
conflicts=("libstr-git")
_srcdir="${pkgname}-${_archivever}"
source=("${_srcdir}.tar.gz::${url}/archive/refs/tags/${_archivever}.tar.gz")
sha256sums=('7d95987410b7fa23abdb82be192794917b7730eaa1adfae798c503f28c27d8ef')
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
