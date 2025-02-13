# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-dashboard
pkgver=0.23.1
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
	"wivrn-server"
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
sha256sums=('d8b5b9442b834525c6a1603bac21604bacc932f6abc1fb27b690f4f6c844ad1d')

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
