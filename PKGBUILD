# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=geopard
pkgver=1.1.0
pkgrel=1
pkgdesc="Gemini browser in gtk4"
arch=('x86_64' 'aarch64')
url="https://ranfdev.com/projects/Geopard"
license=('GPL3')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ranfdev/Geopard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2377c911153d6fa37ddeb76f14f096d75e46453d2a1688e21cfc536e4783e647')

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
