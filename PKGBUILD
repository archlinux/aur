# Maintainer: Ben <crushedtortilla at gmail dot com>
pkgname=skanpage-git
pkgver=r254.3bc6865
pkgrel=1
pkgdesc="KDE image scanning application (git version)"
arch=(i686 x86_64)
url="https://invent.kde.org/utilities/skanpage"
license=(GPL)
depends=(kcoreaddons ki18n kxmlgui libksane-git kconfig qt5-base qt5-declarative)
makedepends=(extra-cmake-modules git cmake kio kirigami2)
conflicts=('skanpage')
provides=('skanpage')
source=('git+https://invent.kde.org/utilities/skanpage.git')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}
