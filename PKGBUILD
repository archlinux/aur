# Maintainer: Logan Sevcik <logan+aur@sevcik.email>
pkgname=symmy-git
pkgver=263.deaa059
pkgrel=1
pkgdesc="GPG symmetric encryption frontend"
arch=(any)
url="https://invent.kde.org/utilities/symmy"
license=(GPL2 BSD)
depends=(kio5 qgpgme-qt5)
makedepends=(git cmake extra-cmake-modules kdoctools5 kio5 ki18n5 kwidgetsaddons5 gpgme qt5-base kdelibs4support)
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
