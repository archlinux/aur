# Maintainer: <trahflow@proton.me>
pkgname=com.cassidyjames.butler
_pkgname=butler
pkgver=1.8.3
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
sha256sums=(f35f5a6436317efe5d31330abde7951bd0d7d37f2881b6245438916a5e277ebd)

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
