# ruijie + git at netyu dot xyz

# This is a one-time pkgbuild file I made, and I have no incentive
# to research how to reference the build dependencies available on
# system
pkgname=intel-hexl
_pkgname=hexl
pkgver=1.2.4
pkgrel=2
pkgdesc='Intel® Homomorphic Encryption Acceleration Library accelerates modular arithmetic operations used in homomorphic encryption'
arch=(any)
license=(Apache-2)
url="https://github.com/intel/$_pkgname"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b2c0c54c978fd3801548c040c684dd8a6e61f1035e47cd2ba39a4da5cf4adb31106b20f2dd6d50f76643db2985c00122bb69dd225078d3d7506904f08b9e78d0')
makedepends=(cmake git doxygen)

prepare() {
	cd "$_pkgname-$pkgver"
	_cmake_config_flags=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-DHEXL_BENCHMARK=ON               # benchmarking
		-DHEXL_COVERAGE=OFF               # coverage for unit tests
		-DHEXL_SHARED_LIB=ON              # dynlib
		-DHEXL_DOCS=ON                    # docs
		-DHEXL_TESTING=OFF                # test
		-DHEXL_TREAT_WARNING_AS_ERROR=OFF # -Werror
	)

    rm build -rf
	cmake -S . -B build "${_cmake_config_flags[@]}"
}

build() {
	cd "$_pkgname-$pkgver"
	cmake --build build
}

package() {
	cd "$_pkgname-$pkgver"
	DESTDIR="$pkgdir" cmake --install build
}
