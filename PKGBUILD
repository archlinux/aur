# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: Eikano <lcuoin@gmail.com>
# Contributor: Merrkry <merrkry@tsubasa.moe>

pkgname=tsukimi
pkgver=26.11.1
pkgrel=1
pkgdesc='A simple third-party GTK4 Emby/Jellyfin client'
arch=('x86_64')
url="https://github.com/tsukinaha/tsukimi"
license=('GPL-3.0-or-later')
depends=(
	'mpv' 'libadwaita' 'gstreamer' 'gtk4' 'dconf' 'glib2' 'pango' 'libseccomp'
	'graphene' 'glibc' 'libgcc' 'hicolor-icon-theme' 'fontconfig' 'lcms2'
)
makedepends=('cargo' 'git' 'meson' 'blueprint-compiler')
source=("git+https://github.com/tsukinaha/tsukimi.git#tag=v$pkgver")
sha256sums=('c1ebe39233b904cf322d3c640578433e0f551e2b8a448d1487e415653c5731aa')
options=(!lto) # `ring` crate does compile with LTO

build() {
	arch-meson $pkgname build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}
