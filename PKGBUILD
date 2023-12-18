# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=overskride
pkgver=0.5.6
pkgrel=2
pkgdesc='A simple yet powerful bluetooth client'
url="https://github.com/kaii-lb/overskride"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('bluez' 'libadwaita' 'libpulse')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
