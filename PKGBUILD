# Maintainer: anon <anon@example.com>

pkgname=wmenu
pkgver=0.1.5
pkgrel=1
pkgdesc="Efficient dynamic menu for Wayland"
arch=('any')
url="https://git.sr.ht/~adnano/wmenu"
license=('MIT')
depends=('cairo' 'libxkbcommon' 'pango' 'wayland')
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~adnano/wmenu/archive/$pkgver.tar.gz")
b2sums=('be3d03a3433af9b7c5d934630404f7cb3691f7d79ae1a53eaf8d528a385311844900e9f37d72f53bdf92360cc5115977d98e3ea862677bed27471342c8d9c9c8')

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
