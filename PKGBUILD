# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-dashboard
pkgver=0.19.1
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
)
makedepends=("cmake")

# source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
# sha256sums=('2e6e0813b82e97ed3230140764cf935f06208a89f0dd5ac883825ba5c458ee3f')
source=('wivrn::git+https://github.com/WiVRn/WiVRn.git')
sha256sums=('SKIP')

build() {
	cd wivrn
	cmake -B build-dashboard . -GNinja \
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
	cd wivrn
	DESTDIR="$pkgdir" cmake --install build-dashboard
}
