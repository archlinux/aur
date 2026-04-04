# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=footage
pkgver=1.3.3
pkgrel=1
pkgdesc="Polish your videos"
url="https://gitlab.com/adhami3310/Footage"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
depends=('a52dec' 'ffmpeg' 'gst-plugin-gtk4' 'gst-editing-services' 'gst-plugins-bad'
         'gst-plugins-ugly' 'gstreamer-svt-av1' 'gst-plugin-va' 'libadwaita'
         'libmpeg2' 'svt-av1' 'x264' 'x265')
makedepends=('blueprint-compiler' 'cargo' 'meson')
checkdepends=('appstream-glib')
source=("$url/-/archive/v$pkgver/Footage-v$pkgver.tar.bz2")
sha256sums=('SKIP')

prepare() {
  cd Footage-v$pkgver
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson Footage-v$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
