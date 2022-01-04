# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: FenixFyreX <chaz.domerese@gmail.com>

pkgname=amixst
pkgver=1.0.1
pkgrel=2
pkgdesc='Qt5 volume wheel'
arch=('x86_64')
url='https://github.com/FenixFyreX/amixst'
license=('GPL3')
depends=('qt5-base' 'libasound.so')
makedepends=('qt5-tools')
optdepends=('qt5-styleplugins: more Qt5 styles')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f9f51d123ab8c2a5184699b6e9937c23ee3b7253c4394bd2aeee34501f358008')

prepare() {
	mkdir -p build
}

build() {
	cd build
	qmake-qt5 "../amixst-${pkgver}"/src/amixst.pro \
		CONFIG+=release \
		-spec linux-g++
	make
}

package() {
	cd build
	install -D "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/$pkgname-$pkgver/etc/conf" -t "$pkgdir/etc/$pkgname/"
	install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
