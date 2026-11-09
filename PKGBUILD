# Maintainer: Richard Fakenberg (OK1BR) <rifak@protonmail.com>
# AUR package for the tagged release.
# Bump: raise _pkgtag, `updpkgsums`, verify with a full makepkg, then push
# this file plus `makepkg --printsrcinfo > .SRCINFO` to
# ssh://aur@aur.archlinux.org/ftx-for-linux.git.
pkgname=ftx-for-linux
_pkgtag=0.1.0
pkgver=0.1.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita FT8 and FT4 program for TCI radios (decoders ported from WSJT-X)"
arch=('x86_64')
url="https://github.com/OK1BR/ftx-for-linux"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glib2' 'fftw' 'libwebsockets')
# desktop-file-utils + gtk-update-icon-cache: gnome.post_install wants both
# tools at meson-configure time even though DESTDIR skips the actual refresh.
makedepends=('meson' 'desktop-file-utils' 'gtk-update-icon-cache')
source=("$pkgname-$_pkgtag.tar.gz::$url/archive/refs/tags/v$_pkgtag.tar.gz")
sha256sums=('88fce89b7d1415d8f131e8b7204bc5c7cd10d86cab9df224ed7daedf12e68cf0')

build() {
  arch-meson "$pkgname-$_pkgtag" build
  meson compile -C build
}

package() {
  # meson installs LICENSE to /usr/share/licenses/$pkgname/ itself.
  meson install -C build --destdir "$pkgdir"
}
