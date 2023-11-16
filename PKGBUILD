# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=footage
pkgver=1.3.1
pkgrel=1
pkgdesc="Polish your videos"
url="https://gitlab.com/adhami3310/Footage"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('a52dec' 'fdkaac' 'gst-editing-services' 'gst-plugins-rs'
         'libadwaita' 'libmpeg2' 'svt-av1' 'vo-aacenc' 'x264' 'x265')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd Footage
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson Footage build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
