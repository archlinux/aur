# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: solopasha <daron439@gmail.com>

pkgname=mpv_inhibit_gnome
pkgver=0.1.3
pkgrel=3
pkgdesc="This mpv plugin prevents screen blanking in GNOME while playing media"
arch=('x86_64')
url="https://github.com/Guldoman/mpv_inhibit_gnome"
license=( 'MIT' )
depends=(
	mpv
	dbus
)
source=("$pkgname-$pkgver.zip"::"$url/archive/tags/v$pkgver.zip")
b2sums=('de7b142fb36880e2f107dd43375805783aed5b4e62d53dbdd4dea8057f3bd66b681c236c4d63fbccee897ec555cb4e0a19cbe78e918ce5a442a6213afc4b13f7')

build() {
	cd "$pkgname-tags-v$pkgver"
	make
}

package() {
	cd "$pkgname-tags-v$pkgver"
	install -d "$pkgdir/etc/mpv/scripts"
	install -Dm755 "lib/mpv_inhibit_gnome.so" -t "$pkgdir/usr/lib/mpv"
	ln -sf /usr/lib/mpv/mpv_inhibit_gnome.so "$pkgdir/etc/mpv/scripts"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
