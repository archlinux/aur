_pkgname=neon2sse
pkgname=${_pkgname}-git
pkgver=r88.ed59be8
pkgrel=1
pkgdesc="The platform independent header allowing to compile any C/C++ code containing ARM NEON intrinsic functions for x86 target systems using SIMD up to AVX2 intrinsic functions"
arch=('any')
url="https://github.com/intel/ARM_NEON_2_x86_SSE"
license=('custom')
depends=()
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::'git+https://github.com/intel/ARM_NEON_2_x86_SSE.git')
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cmake -B build -S "${_pkgname}" \
		-D CMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
