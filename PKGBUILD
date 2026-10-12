# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: Eikano <lcuoin@gmail.com>
# Contributor: Merrkry <merrkry@tsubasa.moe>

pkgname=tsukimi
pkgver=26.9.2
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
sha256sums=('27f937a89960d78fa79b0628f9620cebae336fae88ffaccb8beb000776f6ad0e')
options=(!lto) # `ring` crate does compile with LTO

build() {
	arch-meson $pkgname build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}
