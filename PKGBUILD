# Maintainer: Russell Greene <russellgreene8 at gmail dot com>

pkgname=chigraph-gui
pkgver=1.0.0a
pkgrel=1
arch=('i686' 'x86_64')

conflicts=("chigraph-gui-git")

pkgdesc="The GUI for chigraph, a visual programming language"
url='https://github.com/chigraph/chigraph'

depends=('chigraph' 'kxmlgui' 'ktexteditor')
makedepends=('cmake' 'extra-cmake-modules' 'tar' 'gzip')

source=("https://github.com/russelltg/nodeeditor/archive/v${pkgver}.tar.gz:nodeeditor-${pkgver}.tar.gz" \
		"https://github.com/chigraph/chigraph-gui/archive/v${pkgver}.tar.gz:chigraph-gui-${pkgver}.tar.gz")
md5sums=('SKIP' 'SKIP')

prepare() {

	mkdir -p build

	tar xf chigraph-gui-${pkgver}.tar.gz
	cd chigraph-gui-${pkgver}/third_party/nodeeditor
	
	tar xf ../../../nodeeditor-${pkgver}.tar.gz --strip-components=1
	
}

build() {
	cd build
	cmake ../chigraph-gui-${pkgver} -DCMAKE_BUILD_TYPE=Release -DCG_USE_SYSTEM_CHIGRAPH=ON -DCMAKE_INSTALL_PREFIX=/usr
	make -j`nproc`
}

package() {
	make -C build DESTDIR="${pkgdir}" install
}
