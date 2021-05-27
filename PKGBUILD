pkgname=ananicy-cpp
pkgver=0.5.0
pkgrel=1
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
url="https://gitlab.com/aviallon/ananicy-cpp/"
license=(GPLv3)
source=(
	"https://gitlab.com/aviallon/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
	)
md5sums=('a1a3a551f8e0ce8a3b70bcd32804ec70')
arch=(x86_64 i386 armv7h)
depends=(fmt spdlog nlohmann-json systemd)
makedepends=(cmake git)
optdepends=(ananicy)

prepare() {
	cd "$pkgname-v${pkgver}"

	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_EXTERNAL_SPDLOG=ON \
		-DUSE_EXTERNAL_JSON=ON \
		-DUSE_EXTERNAL_FMTLIB=ON \
		-DVERSION=${pkgver}
}

build() {
	cd "$pkgname-v${pkgver}/build"

	cmake --build .
}

package() {
	cd "$pkgname-v${pkgver}/build"

	export DESTDIR="$pkgdir"
	cmake --install .
}

