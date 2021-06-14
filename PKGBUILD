# Maintainer: lsdaniel <lsdaniel01+aur at gee mail dot com>
pkgname=symmy-git
pkgver=156.3ae3fec
pkgrel=1
pkgdesc="GPG symmetric encryption frontend"
arch=(any)
url="https://invent.kde.org/utilities/symmy"
license=(GPL2 BSD)
depends=(kio gpgme)
makedepends=(git cmake extra-cmake-modules kdoctools kio ki18n kwidgetsaddons gpgme qt5-base kdelibs4support)
source=(git+https://invent.kde.org/utilities/symmy.git)
md5sums=('SKIP')

pkgver() {
	cd symmy

	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S symmy \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix)
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
