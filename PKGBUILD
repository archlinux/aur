pkgname=ananicy-cpp
pkgver=0.2.0.1
pkgrel=1
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage."
source=(
	"git+https://gitlab.com/aviallon/ananicy-cpp.git#tag=v${pkgver}"
	)
md5sums=(SKIP)
arch=(x86_64 i386 armv7h)
depends=(ananicy fmt spdlog nlohmann-json)

prepare() {
	cd "$pkgname"

	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_EXTERNAL_SPDLOG=ON \
		-DUSE_EXTERNAL_JSON=ON \
		-DUSE_EXTERNAL_FMTLIB=ON
}

build() {
	cd "$pkgname/build"

	cmake --build .
}

package() {
	cd "$pkgname/build"

	export DESTDIR="$pkgdir"
	cmake --install .
}

