# Maintainer: lpt <aur AT lucapetrucci DOT net>
pkgname="qdiskinfo"
_pkgname="QDiskInfo"
pkgver="0.4"
pkgrel="2"
pkgdesc="CrystalDiskInfo alternative for Linux"
url="https://github.com/edisionnano/QDiskInfo"
license=("GPL-3.0-only")
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
	"33762f494f2da4b59e770207ad5bacca4394774c76509c15d3e3fa23fbf76d33"
)
arch=("x86_64")
depends=(
	"qt6-base"
	"qt6-svg"
	"smartmontools"
	"polkit"
	"hicolor-icon-theme"
	"vulkan-icd-loader"
)
makedepends=(
	"cmake"
	"qt6-declarative"
	"qt6-tools"
	"clang"
	"vulkan-headers"
)

build () {
	cd "$_pkgname-$pkgver"
	cmake \
		-DCMAKE_BUILD_TYPE=MinSizeRel \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT_VERSION_MAJOR=6 \
		-DENABLE_TRANSLATIONS=ON \
		-G"Unix Makefiles" \
		-Bbuilddir \
		-S.
	cmake --build builddir
}

package () {
	cd "$_pkgname-$pkgver"
	DESTDIR="$pkgdir" cmake --build builddir --target install
	install -Dm0644 "dist/QDiskInfo.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/QDiskInfo.png"
	install -Dm0644 "dist/QDiskInfo-256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/QDiskInfo.png"
}
