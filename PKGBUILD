# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=pwvucontrol
pkgver=0.5.2
pkgrel=1
pkgdesc="Pipewire volume control for GNOME"
url="https://github.com/saivert/pwvucontrol"
arch=(x86_64)
license=(GPL-3.0-only)

depends=(glib2 gtk4 libadwaita wireplumber)
makedepends=(rust clang meson blueprint-compiler)
checkdepends=(appstream-glib)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")

b2sums=('fb749511f886a0481edc5e6d8312241503d133724f316a76dfc1c3222c1b1874d4ed332fe847b358340cef8258ca04e56bd33ed2a72a713cacf8e06f992a7031')

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
