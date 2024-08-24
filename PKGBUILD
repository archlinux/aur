# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=resources
pkgver=1.6.0
_commit=f254bcf43fd4d39fddf0169e0f98f59176dff3f9
pkgrel=1
pkgdesc="Keep an eye on system resources"
url="https://github.com/nokyan/resources"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('dmidecode' 'libadwaita' 'polkit')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
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
