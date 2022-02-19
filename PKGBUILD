# Maintainer: Namkhai B. <echo bmFta2hhaS5uM0Bwcm90b25tYWlsLmNvbQo= | base64 -d>

_pkgname=ananicy-cpp
pkgname=ananicy-cpp-nosystemd
_pkgver=1.0.0-rc5
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Ananicy rewritten in C++ for much lower CPU and memory usage."
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=(GPLv3)
source=(
	"https://gitlab.com/ananicy-cpp/${_pkgname}/-/archive/v${_pkgver}/${_pkgname}-v${_pkgver}.tar.gz")
sha256sums=('90f4b7ddb49246db2329cfdf5727c1f2caa22285dcbc5b7cdaba6bcf2c946676')
arch=(x86_64 i386 armv7h)
depends=(fmt spdlog)
makedepends=(cmake nlohmann-json)
optdepends=("ananicy-rules-git: community rules")
conflicts=(ananicy-cpp)

build() {
	cmake -B "build" \
        -S "$_pkgname-v${_pkgver}" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_EXTERNAL_SPDLOG=ON \
		-DUSE_EXTERNAL_JSON=ON \
		-DUSE_EXTERNAL_FMTLIB=ON \
		-DENABLE_SYSTEMD=OFF \
		-DVERSION=${_pkgver}
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
