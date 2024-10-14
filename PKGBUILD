# Maintainer: John A. Leuenhagen <john@zlima12.com>

pkgname=cpr
pkgver=1.11.0
pkgrel=3
pkgdesc='C++ Requests: Curl for People, a spiritual port of Python Requests.'
arch=('i686' 'x86_64')
url="https://github.com/libcpr/cpr"
license=('MIT')
depends=('curl')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fdafa3e3a87448b5ddbd9c7a16e7276a78f28bbe84a3fc6edcfef85eca977784')

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
