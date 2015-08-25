# Maintainer: Jerome Leclanche <jerome.leclanche+arch@gmail.com>

pkgname=kwin-standalone-git
pkgver=v4.5.95.6482.g2f23192
pkgrel=1
pkgdesc="Standalone version of KWin which doesn't pull in the rest of kdebase-workspace."
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
# groups=('kde')
provides=('kwin')
conflicts=('kde-workspace')
depends=('kdelibs' 'kdebase-runtime' 'xcb-util-renderutil' 'xcb-util-image')
makedepends=('cmake' 'automoc4')
source=("git://anongit.kde.org/clones/kde-workspace/graesslin/kde-workspace.git#branch=kwin/standalone")
sha256sums=("SKIP")
_gitname="kde-workspace"

pkgver() {
	cd "$srcdir/$_gitname"                                                                                                                                                      
	echo $(git describe --always | sed 's/-/./g')
}


build() {
	cd "$srcdir"
	mkdir -p build
	cd build
	cmake ../${_gitname}/kwin \
		-DKWIN_BUILD_OXYGEN=OFF \
		-DKWIN_BUILD_KAPPMENU=OFF \
		-DKWIN_BUILD_ACTIVITIES=OFF \
		-DKWIN_BUILD_KCMS=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="${pkgdir}"
}
