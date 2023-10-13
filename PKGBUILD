# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=resources
pkgver=1.0.3
pkgrel=1
pkgdesc="Monitor your system resources and processes"
url="https://github.com/nokyan/resources"
arch=('x86_64')
license=('GPL3')
depends=('dmidecode' 'libadwaita' 'polkit')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
