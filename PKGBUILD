# Maintainer: George Hu <integral@archlinux.org>

pkgname=gitte
_srcname=Gitte
pkgver=0.11.1
pkgrel=1
pkgdesc="A GTK4/libadwaita Git client for the GNOME desktop"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://codeberg.org/ckruse/${_srcname}"
license=('AGPL-3.0-or-later')
depends=(
	'cairo'
	'dconf'
	'glib2'
	'glibc'
	'graphene'
	'gtk4'
	'hicolor-icon-theme'
	'libadwaita'
	'libgcc'
	'libgit2'
	'openssl'
	'pango'
	'xz'
	'zlib'
)
makedepends=('cargo' 'git' 'meson' 'ninja')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('f713c5b1e1c9a8081501fd32b3585fcd9cec185a003432e04170cbf32d71b978')

build() {
	export CFLAGS+=" -ffat-lto-objects"
	meson setup --prefix=/usr --libexecdir=lib --buildtype=release build "${_srcname}"
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --no-rebuild --destdir "${pkgdir}"
}
