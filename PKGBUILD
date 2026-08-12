# Maintainer: Richard Fakenberg (OK1BR) <rifak@protonmail.com>
# AUR package for the tagged release.
pkgname=log-for-linux
_pkgtag=0.2.0
pkgver=0.2.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita ham radio logbook (ADIF, contests, Cabrillo, TCI, WSJT-X)"
arch=('x86_64')
url="https://github.com/OK1BR/log-for-linux"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glib2' 'sqlite' 'libwebsockets')
# desktop-file-utils + gtk-update-icon-cache: gnome.post_install wants both
# tools at meson-configure time even though DESTDIR skips the actual refresh.
makedepends=('meson' 'desktop-file-utils' 'gtk-update-icon-cache')
source=("$pkgname-$_pkgtag.tar.gz::$url/archive/refs/tags/v$_pkgtag.tar.gz")
sha256sums=('7d31ec947257fd28bb0417979a21913e2c48f6a9d5fd89dba265a3f56c31d7f3')

build() {
  arch-meson "$pkgname-$_pkgtag" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$_pkgtag/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
