# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=pwvucontrol
pkgver=0.5.1
pkgrel=1
pkgdesc="Pipewire volume control for GNOME"
url="https://github.com/saivert/pwvucontrol"
arch=(x86_64)
license=(GPL-3.0-only)

depends=(glib2 gtk4 libadwaita wireplumber libwireplumber-4.0-compat)
makedepends=(rust clang meson git)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")

b2sums=('d66be3bc85624a770f769ff86d4531ae565436348df8b0e96b8b488b6c06217706b4cc43a387fe745083bd6444827750e2d8a73453ac1726164aad3da104a809')

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
