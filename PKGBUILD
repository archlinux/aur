# Contributor: Weng Xuetian <wengxt@gmail.com>
# Maintainer: BasT <sebastian-thaler at gmx dot net>
pkgname=kmozillahelper-kf5
pkgver=0.6.4.r10.g0219317
pkgrel=1
pkgdesc="Mozilla KDE Integration with KF5 support"
url="https://github.com/openSUSE/kmozillahelper"
arch=("i686" "x86_64")
license=('MIT')
depends=("kio" "ki18n" "knotifications" "kwindowsystem")
makedepends=("cmake" "extra-cmake-modules")
provides=(kmozillahelper-frameworks kmozillahelper)
conflicts=(kmozillahelper-frameworks kmozillahelper)
source=("git+https://github.com/openSUSE/kmozillahelper.git")

pkgver() {
  cd "${pkgname%%-kf5}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	mkdir -p "$srcdir/$pkgname-build"
	cd "$srcdir/$pkgname-build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF \
	-DCMAKE_BUILD_TYPE=Release "$srcdir/${pkgname%%-kf5}"
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-build"
	make DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
