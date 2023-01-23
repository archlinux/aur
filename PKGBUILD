# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

pkgname=heimer
pkgver=3.6.4
pkgrel=1
pkgdesc="Cross-platform mind map, diagram, and note-taking tool written in Qt"
arch=("x86_64")
url='https://github.com/juzzlin/heimer'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b5acfad220cb05642657616b4ae13edef28f0e854f7ee69ba61412c3e1c81f05')

build() {
	cmake \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev \
		-S "Heimer-$pkgver" \
		-B build
	make -C build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir/" make install -C build
	cd "Heimer-$pkgver"
	install -Dvm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
