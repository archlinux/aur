# Maintainer: Gustavo Castro < gustawho [ at ] openmailbox [ dot ] org >
# Contributor: Weng Xuetian <wengxt@gmail.com>

pkgname=kmozillahelper-kf5
pkgver=4.9.13
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
sha512sums=('bf128e0e89b0be29b7c9998de1f72766aee2e7fef59a43826cba0e627631f18e0d3ba3caad631ca27dd2f93bb50ff7cac58e8c98f2aeb922021527a2f59f20c1')

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

