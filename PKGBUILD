# Maintainer: Russell Greene <russellgreene8 at gmail dot com>

pkgname=chigraph-gui-git
pkgver=02decd6f2bf7286bfd95ff779aa97b1535ccf016
pkgrel=2
arch=('i686' 'x86_64')

conflicts=("chigraph-gui")

pkgdesc="The GUI for chigraph, a visual programming language"
url='https://github.com/chigraph/chigraph'

depends=('chigraph-git' 'kxmlgui' 'ktexteditor')
makedepends=('cmake' 'git' 'extra-cmake-modules')

source=("chigraph-gui::git+https://github.com/chigraph/chigraph-gui")
md5sums=('SKIP')

pkgver() {
	cd chigraph-gui
	git rev-parse HEAD
}

prepare() {
	mkdir -p build
	cd chigraph-gui
	git submodule update --init --recursive
}

build() {
	cd build
	cmake ../chigraph-gui -DCMAKE_BUILD_TYPE=Release -DCG_USE_SYSTEM_CHIGRAPH=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
	make -j`nproc`
}

package() {
	make -C build DESTDIR="${pkgdir}" install
}
