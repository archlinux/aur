# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=impression
pkgver=3.0.1
pkgrel=1
pkgdesc="A straight-forward modern application to create bootable drives."
arch=('x86_64')
url="https://apps.gnome.org/Impression"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.com/adhami3310/Impression/-/archive/v$pkgver/Impression-v$pkgver.tar.gz")
sha256sums=('b566b6b18658fdcc72c9bd56f764c48e88ef2a73b262fd8d34d1f5d0361fbba1')

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
