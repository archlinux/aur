# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: Eikano <lcuoin@gmail.com>
# Contributor: Merrkry <merrkry@tsubasa.moe>

pkgname=tsukimi
pkgver=26.8.4
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
sha256sums=('c23325e4f2a4dc2b7d42fc6bdca2ebfcf482efc927f7384f361edf6cb259ac01')
options=(!lto) # `ring` crate does compile with LTO

build() {
	arch-meson $pkgname build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
}
