# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: gumper <gumper1034@gmail.com>

pkgname=libalkimia-git
pkgver=8.1.95.r115.gc24c05f
pkgrel=1
pkgdesc="A library with common classes and functionality used by finance applications for the KDE SC"
arch=('x86_64')
url='https://invent.kde.org/office/alkimia.git'
license=('LGPL-2.1-or-later')
depends=(
	'qt6-webengine' 'knewstuff' 'ktextwidgets' 'python' 'kxmlgui'
	'qt6-declarative' 'kcompletion' 'hicolor-icon-theme' 'kcoreaddons'
	'kconfig' 'kwidgetsaddons' 'gmp' 'qt6-base' 'ki18n'
)
makedepends=('cmake' 'doxygen' 'extra-cmake-modules' 'kdoctools' 'git')
optdepends=('perl: for financequote.pl')
provides=('libalkimia')
conflicts=('libalkimia')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd alkimia
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	local cmake_options=(
		-B build
		-S alkimia
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D QT_MAJOR_VERSION=6
		-D BUILD_APPLETS=OFF
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
