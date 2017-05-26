# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=kregexpeditor-git

pkgver=586.7461ab1
pkgrel=1
pkgdesc="KDE editor for regular expressions"
arch=(i686 x86_64)
url="https://projects.kde.org/projects/playground/utils/kregexpeditor"
license=('GPL')
depends=('qt5-base' 'kconfigwidgets' 'kwidgetsaddons' 'ktextwidgets' 'kio' 'kiconthemes' 'kdoctools' 'hicolor-icon-theme')
makedepends=('git' 'extra-cmake-modules' 'python')
provides=('kregexpeditor')
conflicts=('kregexpeditor')
replaces=('kregexpeditor-svn')

source=('git://anongit.kde.org/kregexpeditor')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/kregexpeditor"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
	mkdir build
}

build() {
	cd build
	cmake ../kregexpeditor \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DKDE_INSTALL_LIBDIR=lib \
		-DBUILD_TESTING=OFF
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
