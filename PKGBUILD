# Maintainer: Gustavo Castro < gustawho [ at ] openmailbox [ dot ] org >
# Contributor: Weng Xuetian <wengxt@gmail.com>

pkgname=kmozillahelper-kf5
pkgver=5.0.1
pkgrel=2
pkgdesc="Mozilla KDE Integration with KF5 support"
url="https://github.com/openSUSE/kmozillahelper"
arch=("i686" "x86_64")
license=('MIT')
depends=("kio" "ki18n" "knotifications" "kwindowsystem")
makedepends=("cmake" "extra-cmake-modules")
provides=(kmozillahelper-frameworks kmozillahelper)
conflicts=(kmozillahelper-frameworks kmozillahelper)
source=("https://github.com/openSUSE/${pkgname%%-kf5}/archive/v${pkgver}.tar.gz")
sha512sums=('bb0150e8856065a00ff75b19d8585315163780665d85d4b0a27742e6611f8da2114a9567bfc27f180be96cfb27062270732bfbf369eaeab6b308e31843e0cbca')
options=('!emptydirs' '!strip')

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

