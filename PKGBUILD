# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=pwvucontrol
pkgver=0.5.0
pkgrel=1
pkgdesc="Pipewire volume control for GNOME"
url="https://github.com/saivert/pwvucontrol"
arch=(x86_64)
license=(GPL-3.0-only)

depends=(glib2 gtk4 libadwaita wireplumber libwireplumber-4.0-compat)
makedepends=(rust clang meson cmake git)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")

b2sums=('e95284c58d56e78fda0e2bd0a9af2149530cb3df0e70fb6fe11ac87f50539ffb28c7679f76f5662a3ccd700ef4a59eb65063ff7f4fa514cdaf7038df13feb6d8')

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
