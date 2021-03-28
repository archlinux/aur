# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=corevantage-x200
_pkgname=corevantage
pkgver=1.0
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Graphical user interface to configure coreboot settings for: ThinkPad X200"
source=("https://github.com/JaGoLi/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('6189522bb43d22f701ceb1ff6b0e5293c0e9409c2705c6bc68d91e2745d5edf5')
makedepends=("qt5-quickcontrols"
	     "cmake")
depends=("nvramtool-git"
	 "qt5-base"
	 "hicolor-icon-theme")

build() {
	cd ${_pkgname}-${pkgver}
	cmake -B build
	make -C build -j`nproc` x200
}

package() {
	cd ${_pkgname}-${pkgver}
	make -C build DESTDIR="$pkgdir/" install
}
