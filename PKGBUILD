# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=corevantage-x201
_pkgname=corevantage
pkgver=1.3
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Graphical user interface to configure coreboot settings for: ThinkPad X201"
source=("https://github.com/JaGoLi/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('2ecc2efe4510cfab3c1264873b43445d260c9dfa071322e0fa2e7d20b8910fa0')
provides=("corevantage")
conflicts=("corevantage")
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
