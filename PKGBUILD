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
b2sums=('8925049526c46c497b960880140e3c126ea568f21d49032774e72aceab9df2e6f0f29db38b2ed5bd904f5e8fb7d9088a1054acbb009c90c812eb482e4bcf5ea6')

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
