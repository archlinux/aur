# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libdex
pkgver=0.2.0
pkgrel=1
pkgdesc='Future-based programming for GLib-based applications and libraries'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/libdex'
license=(LGPL)
depends=(
	gcc-libs
	glib2
	glibc
	gobject-introspection
	liburing
)
makedepends=(
	meson
	vala
)
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('fd7f648da1a8cfc2e6afc60dd1d48fd109ac7ac7bc5c58aebbd0f29e0dd6f0cc54a9059a10d184131229f906781dc3dd33105f5db6ea55d4fe4641377a6992fe')

build() {
	arch-meson "${pkgname}-${pkgver}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
