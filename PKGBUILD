# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=pwvucontrol
pkgver=0.4.6
pkgrel=1
pkgdesc="Pipewire volume control for GNOME"
url="https://github.com/saivert/pwvucontrol"
arch=(x86_64)
license=(GPL-3.0-only)

depends=(glib2 gtk4 libadwaita wireplumber libwireplumber-4.0-compat)
makedepends=(rust clang meson cmake git)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)

b2sums=(
  "f99586b8c4e14b7ff3863caedb8224767b6cda85cd1d23aaa6fe7a2111def3c57e5f118e0e7d217fc5ff1f9c1588984ccdaa1c9170d6e4bedff23d6bf2cbf237"
)

build() {
  arch-meson --reconfigure $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
