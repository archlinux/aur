# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=impression
pkgver=3.0
pkgrel=1
pkgdesc="A straight-forward modern application to create bootable drives."
arch=('x86_64')
url="https://apps.gnome.org/Impression"
license=('GPL3')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.com/adhami3310/Impression/-/archive/v$pkgver/Impression-v$pkgver.tar.gz")
sha256sums=('4d9b360e57da6bf216043c5516ff39525545f686f08787907b02438d6d0d752c')

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
