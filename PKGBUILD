# Maintainer: Leonardo Laureti <lrtlnrd at hotmail dot com>

pkgname=e2-sat-editor
pkgdesc="Satellite channel lists editor: Enigma2, Neutrino, dreambox"
pkgver=1.1.1
pkgrel=1
arch=('any')
url="https://github.com/ctlcltd/e2-sat-editor"
license=('GPL3')

depends=('qt6-base' 'curl')
makedepends=('cmake' 'ninja')
provides=('e2-sat-editor')
conflicts=('e2-sat-editor')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ctlcltd/e2-sat-editor/archive/v$pkgver.tar.gz")
sha256sums=('6ee390f75d337f3acbac8e06d38f73f33096de664426bbcf40c2d457b8d35732')

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
