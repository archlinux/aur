# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=pwvucontrol
pkgver=0.5.3
pkgrel=2
pkgdesc="Pipewire volume control for GNOME"
url="https://github.com/saivert/pwvucontrol"
arch=(x86_64)
license=(GPL-3.0-only)

depends=(glib2 gtk4 libadwaita wireplumber)
makedepends=(rust clang meson blueprint-compiler)
checkdepends=(appstream-glib)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")

b2sums=('530cfe3ed76121f95bb3696ba1d9d0a66b8c392494a32c421104b1da5c5a2cff1ab86f0d9122dc1bb9d21f9d320c6b1cbd45897499dfa99c783d640d3a6c21e7')

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
