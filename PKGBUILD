# Maintainer: <trahflow@proton.me>
pkgname=com.cassidyjames.butler
_pkgname=butler
pkgver=1.4.0
pkgrel=1
pkgdesc="A Home Assistant companion app for GNOME"
url="https://github.com/cassidyjames/butler"
license=('GPL-3.0-or-later')
arch=(x86_64)
depends=(
	'glib2>=2.82.0'
	'gtk4>=4.16.1'
	'libadwaita>=1.6.0'
	'webkitgtk-6.0>=2.46.0'
)
makedepends=(
	'meson>=1.5.1'
	vala
)
source=("https://github.com/cassidyjames/butler/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(4d8383ac9e73021994519406acaee7eccff2e023e87cc5ff574ce0450067130c)

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
	arch-meson "$_pkgname-$pkgver" build -D profile=release
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
