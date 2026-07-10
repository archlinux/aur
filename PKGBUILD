# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=pwvucontrol
pkgver=0.5.3
pkgrel=1
pkgdesc="Pipewire volume control for GNOME"
url="https://github.com/saivert/pwvucontrol"
arch=(x86_64)
license=(GPL-3.0-only)

depends=(glib2 gtk4 libadwaita wireplumber)
makedepends=(rust clang meson blueprint-compiler)
checkdepends=(appstream-glib)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")

b2sums=('8c1d9c74921eac5ae6d1da0e6350cc1910904abad4c914f73f606520c7a88ec6b58628f44df9aab7685cadb7d4fa23a14fe013b8828abe4e1c46b3481a3f6be2')

build() {
  arch-meson --reconfigure $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
