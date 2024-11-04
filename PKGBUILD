# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-dashboard
pkgver=0.21.1
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-only")
depends=(
	"gcc-libs"
	"glibc"
	"hicolor-icon-theme"
	"qt6-base"
	"wivrn-server"
	"polkit"
	"libcap"
	"boost-libs"
)
makedepends=(
	"cmake"
	"boost"
	"librsvg"
	"glib2-devel"
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5fe84979e798812565c59447fc39109c955638c7889fe560a3d71ae1904f653c')

build() {
	cd "WiVRn-$pkgver"
	cmake -B build-dashboard . \
	-DGIT_DESC=v${pkgver} \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_SERVER=OFF \
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
