# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-dashboard
pkgver=0.23
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-only")
depends=(
	"gcc-libs"
	"glibc"
	"hicolor-icon-theme"
	"ki18n"
	"kiconthemes"
	"kirigami"
	"libcap"
	"polkit"
	"qcoro"
	"qqc2-desktop-style"
	"qt6-base"
	"qt6-declarative"
	"vulkan-icd-loader"
# 	"wivrn-server"
)
makedepends=(
	"cmake"
	"boost"
	"extra-cmake-modules"
	"kcoreaddons"
	"librsvg"
	"glib2-devel"
	"qt6-tools"
	"nlohmann-json"
	"vulkan-headers"
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70b409e5f81f79241416bb74d3a182f23ee3518dac49113b18e5e9c8aa94def6')

build() {
	cd "WiVRn-$pkgver"
	cmake -B build-dashboard . \
	-DGIT_DESC=v${pkgver} \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_SERVER=OFF \
	-DWIVRN_BUILD_WIVRNCTL=OFF \
	-DWIVRN_BUILD_DASHBOARD=ON \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-Wno-dev

	cmake --build build-dashboard
}

package() {
	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-dashboard
}
