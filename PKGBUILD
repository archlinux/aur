# Maintainer: Eden Rose(EndlessEden) < eden (at) rose.place >
# Contributor: dreieck <oid-maps@seznam.cz>
# Contributor: ZhangHua <unlisted>
# Contributor: Dzon Kosto (JohnyPea) <johnypean@gmail.com>
# Contributor: Max Resch <resch.max@gmail.com>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>
#
# COPIED FROM AUR3
#


pkgname=kcm-polkit-kde-git
epoch=1
pkgver=5.9.0.r215.g4aca751
pkgrel=1
pkgdesc="Configuration for Policy Kit"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/base/polkit-kde-kcmodules-1"
license=('GPL')
provides=('polkit-kde-kcmodules' 'kcm-polkit-kde')
conflicts=('polkit-kde-kcmodules')
depends=('kcmutils')
makedepends=('cmake' 'dbus' 'git' 'extra-cmake-modules')

source=($pkgname::"git+https://invent.kde.org/system/polkit-kde-kcmodules-1.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/"$pkgname"

	echo $(cat CMakeLists.txt | grep QT_MIN_VERSION | head -1 | sed 's,set(QT_MIN_VERSION ",,g; s,"),,g')'.r'"$(git rev-list --count HEAD)"'.g'"$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"/"$pkgname"

	cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
	make
}

package() {
	cd "$srcdir"/"$pkgname"

	make DESTDIR="${pkgdir}" install
}
