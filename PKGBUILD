# Maintainer: anon <anon@example.com>

pkgname=wmenu
pkgver=0.1.4
pkgrel=1
pkgdesc="Efficient dynamic menu for Wayland"
arch=('any')
url="https://git.sr.ht/~adnano/wmenu"
license=('MIT')
depends=('cairo' 'libxkbcommon' 'pango' 'wayland')
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~adnano/wmenu/archive/$pkgver.tar.gz")
b2sums=('9670ec0e9040fe8015938d005eb6b366dd56344694d585b2958fb20e8a38b921ed0ffdd9df0f8a6f05bd4c24a69b58d4b06e886916489627380e9258c940af87')

build() {
	cd "$pkgname-$pkgver"
	meson --prefix="/usr" --buildtype=release -Db_lto=true build
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
