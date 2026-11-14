# Maintainer: <trahflow@proton.me>
pkgname=com.cassidyjames.butler
_pkgname=butler
pkgver=1.9.0
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
  'blueprint-compiler>=0.18.0'
	vala
)
source=("https://github.com/cassidyjames/butler/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7b4832f43b98b406963c18f71ec41225ae1fcee6b7ba8b7926afc4736b7363c4')

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
