# Maintainer: ZhangHua <zhanghuadedn at gmail dot com>
# Contributor: Eden Rose(EndlessEden) < eden (at) rose.place >
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
pkgver=5.9.0.r229.g294c719
pkgrel=2
pkgdesc="Configuration for Policy Kit"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/base/polkit-kde-kcmodules-1"
license=('GPL')
provides=('polkit-kde-kcmodules' 'kcm-polkit-kde')
conflicts=('polkit-kde-kcmodules' 'kcm-polkit-kde')
depends=(
	'kcmutils5' 'glibc' 'kconfigwidgets5' 'ki18n5' 'polkit-qt5' 'qt5-base' 'gcc-libs'
	'kwidgetsaddons5' 'kcoreaddons5'
)
makedepends=('cmake' 'dbus' 'git' 'extra-cmake-modules')

source=($pkgname::"git+https://invent.kde.org/system/polkit-kde-kcmodules-1.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/"$pkgname"

	_qt_min_version=$(grep QT_MIN_VERSION CMakeLists.txt | head -1 | sed 's,set(QT_MIN_VERSION ",,g; s,"),,g')
	echo "$_qt_min_version.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {

	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {

	 DESTDIR="${pkgdir}" cmake --install build
}
