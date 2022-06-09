# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=geopard
pkgver=1.2.0
pkgrel=1
pkgdesc="Colorful, adaptive gemini browser"
arch=('x86_64' 'aarch64')
url="https://ranfdev.com/projects/Geopard"
license=('GPL3')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ranfdev/Geopard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ddfaf917bb38418e60e3f70600b2396642bd586fe0fa78af3489e9203e9e820e')

prepare() {
  cd "Geopard-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Geopard-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
