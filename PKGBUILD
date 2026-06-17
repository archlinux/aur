# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: Eikano <lcuoin@gmail.com>
# Contributor: Merrkry <merrkry@tsubasa.moe>

pkgname=tsukimi
pkgver=26.6.2
pkgrel=1
pkgdesc='A simple third-party GTK4 Emby/Jellyfin client'
arch=('x86_64')
url="https://github.com/tsukinaha/tsukimi"
license=('GPL-3.0-or-later')
depends=(
	'mpv' 'ffmpeg' 'libadwaita' 'gstreamer' 'gtk4' 'dconf' 'glib2' 'pango'
	'graphene' 'glibc' 'libgcc' 'hicolor-icon-theme' 'gdk-pixbuf2'
)
makedepends=('cargo' 'git' 'meson')
source=("git+https://github.com/tsukinaha/tsukimi.git#tag=v$pkgver")
sha256sums=('1415d1f8f636a12efd637cb2b949c4835fd5d910db9003a9812333a65d223179')
options=(!lto) # `ring` crate does compile with LTO

build() {
	arch-meson $pkgname build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}
