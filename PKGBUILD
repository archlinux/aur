# Contributor: Pedram Pourang <tsujan2000@gmail.com>
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com

pkgname=kvantum-qt5
pluginname=kvantum
gitname=Kvantum
pkgver=0.10.4
pkgrel=1
pkgdesc="SVG-based Qt5 theme engine plus a config tool and extra themes"
arch=('x86_64')
url="https://github.com/tsujan/Kvantum"
license=('GPL')
groups=('qt')
depends=('qt5-base' 'qt5-svg' 'qt5-x11extras' 'libx11' 'libxext>')
makedepends=('cmake' 'qt5-tools')
conflicts=("kvantum-qt5-git")
source=("https://github.com/tsujan/Kvantum/archive/V"$pkgver".tar.gz")
sha256sums=('0fda33ebca0708435eb2a03f04a850bc7490ba415122e442820a11ce6511bc58')

build() {
	cd "${srcdir}/${gitname}-${pkgver}/${gitname}"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
	make
}

package() {
	cd "${srcdir}/${gitname}-${pkgver}/${gitname}"
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir/usr/share/doc/kvantum"
	cp ChangeLog "$pkgdir/usr/share/doc/kvantum"
	cp COPYING "$pkgdir/usr/share/doc/kvantum"
	cp -r doc "$pkgdir/usr/share/doc/kvantum"
}
