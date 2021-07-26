# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

pkgname=ananicy-cpp
pkgver=0.8.1
pkgrel=1
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=(GPLv3)
source=(
	"https://gitlab.com/ananicy-cpp/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
	)
md5sums=('9dc6733e150b4abd57ae79be8789c729')
arch=(x86_64 i386 armv7h)
depends=(fmt spdlog nlohmann-json systemd)
makedepends=(cmake git)
optdepends=("ananicy-rules-git: community rules")

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

	install -m755 -d "$pkgdir/etc/ananicy.d"
}

