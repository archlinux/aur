# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

pkgname=heimer
pkgver=3.5.0
pkgrel=1
pkgdesc="Cross-platform mind map, diagram, and note-taking tool written in Qt"
arch=("x86_64")
url='https://github.com/juzzlin/heimer'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ff13f87afda233f208f9eb58871711634843104602c42d7de0b8ade4f057e2b9')

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
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
