# Maintainer: John A. Leuenhagen <john@zlima12.com>
# Maintainer: Horror Proton <107091537+horror-proton@users.noreply.github.com> -> https://github.com/horror-proton
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=cpr
pkgver=1.11.1
pkgrel=1
pkgdesc='C++ Requests: Curl for People, a spiritual port of Python Requests.'
arch=('i686' 'x86_64')
url="https://github.com/libcpr/cpr"
license=('MIT')
depends=('curl')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e84b8ef348f41072609f53aab05bdaab24bf5916c62d99651dfbeaf282a8e0a2')

build() {
	local _flags=(
		-DCPR_BUILD_TESTS=OFF
		-DCPR_USE_SYSTEM_CURL=ON
		-DBUILD_SHARED_LIBS=ON
	)

	cmake -B build -S "cpr-${pkgver}" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		"${_flags[@]}"

	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -D "cpr-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
