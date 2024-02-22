# Maintainer: Leonardo Laureti <lrtlnrd at hotmail dot com>

pkgname=e2-sat-editor
pkgdesc="Satellite channel lists editor: Enigma2, Neutrino, dreambox"
pkgver=1.2.0
pkgrel=1
arch=('any')
url="https://github.com/ctlcltd/e2-sat-editor"
license=('GPL3')

depends=('qt6-base' 'curl')
makedepends=('cmake' 'ninja')
provides=('e2-sat-editor')
conflicts=('e2-sat-editor')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ctlcltd/e2-sat-editor/archive/v$pkgver.tar.gz")
sha256sums=('7a9c13c5c6e997b3af556d4f791b03c080971870b3f3c69774e244412bd468bf')

build() {
	cd "$srcdir/$pkgname-$pkgver/src"

	cmake -G Ninja -B build\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_INSTALL_PREFIX=/usr
	ninja -C build
}

package() {
	cd "$srcdir/$pkgname-$pkgver/src"

	DESTDIR="$pkgdir" ninja -C build install

	install -Dm644 "$srcdir/$pkgname-$pkgver/src/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
