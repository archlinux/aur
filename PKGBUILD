# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

pkgname=heimer
pkgver=2.8.0
pkgrel=1
pkgdesc="Cross-platform mind map, diagram, and note-taking tool written in Qt"
arch=("x86_64")
url='https://github.com/juzzlin/heimer'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('93f3928cb9d715c93873bb96d04d8e711530c0a38bf683d675d2604cffae0a3a')

build() {
	cmake \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev \
		-S "Heimer-$pkgver" \
		-B build
	make -C build
}

package() {
	DESTDIR="$pkgdir/" make install -C build
	cd "Heimer-$pkgver"
	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
