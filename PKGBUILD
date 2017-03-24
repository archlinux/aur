# $Id$
# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kuiviewer-git
pkgver=16.12.3.r24.gd10790d
pkgrel=1
pkgdesc='Qt .ui file viewer'
url='https://www.kde.org/applications/development/'
arch=(i686 x86_64)
license=(GPL LGPL FDL)
depends=(qt5-base qt5-tools kcoreaddons kjobwidgets kio ki18n kparts kwidgetsaddons)
makedepends=(cmake)
conflicts=(kdesdk-dev-utils kdesdk-kuiviewer)
provides=(kuiviewer)
source=('git://anongit.kde.org/kde-dev-utils')
sha256sums=(SKIP)

pkgver() {
	cd kde-dev-utils
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	mkdir -p build
	cd build
	cmake ../kde-dev-utils/kuiviewer \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
