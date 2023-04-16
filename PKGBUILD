# Maintainer: anon <anon@example.com>

pkgname=wmenu
pkgver=0.1.3
pkgrel=1
pkgdesc="Efficient dynamic menu for Wayland"
arch=('any')
url="https://git.sr.ht/~adnano/wmenu"
license=('MIT')
depends=('cairo' 'libxkbcommon' 'pango' 'wayland')
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~adnano/wmenu/archive/$pkgver.tar.gz")
b2sums=('f05c71a22319465506af48f8dff1d4155bb8d3b0704a24169034e7d05b56cdadf8cc4c78efcc0f840993670d9956d37b1cacf0cd1ffa8a3362a3682b332bf2de')

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
