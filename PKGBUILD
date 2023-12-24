# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=resources
pkgver=1.3.0
pkgrel=1
pkgdesc="Monitor your system resources and processes"
url="https://github.com/nokyan/resources"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('dmidecode' 'libadwaita' 'polkit')
makedepends=('cargo' 'git' 'meson')
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
  arch-meson $pkgname build -Dprofile=default
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
