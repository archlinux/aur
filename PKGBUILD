# Maintainer: Daniel Menelkir <menelkir@itroll.org>

pkgname=ananicy-cpp-nosystemd
pkgver=0.5.1
pkgrel=1
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=(GPLv3)
source=(
	"https://gitlab.com/ananicy-cpp/ananicy-cpp/-/archive/v${pkgver}/ananicy-cpp-v${pkgver}.tar.gz"
	)
md5sums=('5b16dc5595778fb8011837cfc2ab6ca1')
arch=(x86_64 i386 armv7h)
depends=(fmt spdlog nlohmann-json)
makedepends=(cmake git)
optdepends=("ananicy-nosystemd-git: community rules")

prepare() {
	cd "ananicy-cpp-v${pkgver}"

	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_EXTERNAL_SPDLOG=ON \
		-DUSE_EXTERNAL_JSON=ON \
		-DUSE_EXTERNAL_FMTLIB=ON \
		-DENABLE_SYSTEMD=OFF \
		-DOPTIMIZE_FOR_NATIVE_MICROARCH=ON \
		-DVERSION=${pkgver}
}

build() {
	cd "ananicy-cpp-v${pkgver}/build"

	cmake --build .
}

package() {
	cd "ananicy-cpp-v${pkgver}/build"

	export DESTDIR="$pkgdir"
	cmake --install .

	install -m755 -d "$pkgdir/etc/ananicy.d"
}


