# Maintainer: Leonardo Laureti <lrtlnrd at hotmail dot com>

pkgname=e2-sat-editor
pkgdesc="Satellite channel lists editor: Enigma2, Neutrino, dreambox"
pkgver=1.4.0
pkgrel=1
arch=('any')
url="https://github.com/ctlcltd/e2-sat-editor"
license=('GPL3')

depends=('qt6-base' 'qt6-translations' 'curl')
makedepends=('cmake' 'ninja')
provides=('e2-sat-editor')
conflicts=('e2-sat-editor')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ctlcltd/e2-sat-editor/archive/v$pkgver.tar.gz")
sha256sums=('4c8cd28348054a757805b9bf8df27699feb3697191d31d02b512bc500e6f6421')

build() {
	cd "$srcdir/$pkgname-$pkgver/src"

	cmake -G Ninja -B build\
		-DCMAKE_BUILD_TYPE=Release\
		-DCMAKE_INSTALL_PREFIX=/usr\
		-DRELEASE_MEDIUM=aur
	ninja -C build
}

package() {
	cd "$srcdir/$pkgname-$pkgver/src"

	DESTDIR="$pkgdir" ninja -C build install

	install -Dm644 "$pkgdir/usr/share/$pkgname/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgdir/usr/share/$pkgname/Readme.txt" "$pkgdir/usr/share/doc/$pkgname/README"
}
