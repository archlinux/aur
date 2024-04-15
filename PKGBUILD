# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=impression
pkgver=3.2.0
pkgrel=1
pkgdesc="A straight-forward modern application to create bootable drives."
arch=('x86_64')
url="https://apps.gnome.org/Impression"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'udisks2')
makedepends=('blueprint-compiler' 'cargo' 'meson')
source=("https://gitlab.com/adhami3310/Impression/-/archive/v$pkgver/Impression-v$pkgver.tar.gz")
sha256sums=('6cf2239ff8e4d58f0851da1c252931b0e8bb06fb493a2786592d6dab8995bab1')

prepare() {
  cd "Impression-v$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Impression-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
