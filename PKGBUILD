# Maintainer: Gustavo Castro < gustawho [ at ] openmailbox [ dot ] org >
# Contributor: Weng Xuetian <wengxt@gmail.com>

pkgname=kmozillahelper-kf5
pkgver=4.9.15
pkgrel=1
pkgdesc="Mozilla KDE Integration with KF5 support"
url="https://github.com/openSUSE/kmozillahelper"
arch=("i686" "x86_64")
license=('MIT')
depends=("kio" "ki18n" "knotifications" "kwindowsystem")
makedepends=("cmake" "extra-cmake-modules")
provides=(kmozillahelper-frameworks kmozillahelper)
conflicts=(kmozillahelper-frameworks kmozillahelper)
source=("https://github.com/openSUSE/${pkgname%%-kf5}/archive/v${pkgver}.tar.gz")
sha512sums=('a3cb31266b38a8e03774e1274c4180a0e85cf1de176a0fa1e2ca398e9c749b968adf7028fd7ec7df77b350318be1420086cfb359667dcf1faeef193bbdcc9abb')

build() {
	mkdir -p "$srcdir/$pkgname-build"
	cd "$srcdir/$pkgname-build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF \
	-DCMAKE_BUILD_TYPE=Release "$srcdir/${pkgname%%-kf5}-${pkgver}"
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-build"
	make DESTDIR="$pkgdir" install
}

