# Maintainer: Shantanu Tushar <shantanu@kde.org>
pkgname=ruqola-git
pkgver=2.5.1.r1198.gb3cd5a3
pkgrel=1
epoch=
pkgdesc="Rocket.Chat client for the KDE desktop"
arch=('x86_64')
url="https://invent.kde.org/network/ruqola/"
license=('GPL2')
groups=()
depends=('qt6-networkauth' 'qt6-websockets' 'qtkeychain-qt6' 'hicolor-icon-theme' 'syntax-highlighting' 'kwidgetsaddons' 'kuserfeedback' 'knotifyconfig' 'kdoctools' 'prison' 'kidletime' 'ktextaddons' 'kxmlgui' 'ktextwidgets' 'kstatusnotifieritem')
makedepends=('cmake' 'extra-cmake-modules' 'git')
provides=(ruqola)
conflicts=(ruqola)
_name=ruqola
source=("git+https://invent.kde.org/network/$_name.git")
md5sums=('SKIP')

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/$_name" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
	cmake --build .
}

package() {
	cd "$srcdir/build"
	DESTDIR="$pkgdir" cmake --install .
}

pkgver() {
	cd "$srcdir/ruqola"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
