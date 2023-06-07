# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=impression
pkgver=1.0.1
pkgrel=1
pkgdesc="A straight-forward modern application to create bootable drives."
arch=('x86_64')
url="https://gitlab.com/adhami3310/Impression"
license=('GPL3')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.com/adhami3310/Impression/-/archive/v$pkgver/Impression-v$pkgver.tar.gz")
sha256sums=('9194dc0220147aadc83828510da592e70869883a724573a37bcaf513d65c4b47')

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
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
