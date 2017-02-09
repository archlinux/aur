# Maintainer: Gustavo Castro < gustawho [ at ] openmailbox [ dot ] org >
# Contributor: Weng Xuetian <wengxt@gmail.com>

pkgname=kmozillahelper-kf5
pkgver=5.0.0
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
sha512sums=('e4ecb232bcea9dde3afe7ad059dbb0bbbb0e5de77708b008de325741efff900c2d8dd442a4a3b3a2fa5e5e44439668223d70126b959a311d2d75a7917edddcbc')

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

