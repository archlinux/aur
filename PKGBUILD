# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=corevantage-x201
_pkgname=corevantage
pkgver=1.2
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Graphical user interface to configure coreboot settings for: ThinkPad X201"
source=("https://github.com/JaGoLi/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('d5497fd8c6e6cf9ddb518272b18e93a77b7bc272e9a8059f4f44325319e9cabe')
makedepends=("qt5-quickcontrols"
	     "cmake")
depends=("nvramtool-corevantage-git"
	 "qt5-base"
	 "hicolor-icon-theme")

build() {
	cd ${_pkgname}-${pkgver}
	cmake -B build
	make -C build -j`nproc` x201
}

package() {
	cd ${_pkgname}-${pkgver}
	make -C build DESTDIR="$pkgdir/" install
}
