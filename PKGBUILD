# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=lorem
pkgver=1.4
_commit=e1a94055c53ba692e8fa9a2e6974719502622d76
pkgrel=1
pkgdesc="Simple app to generate the Lorem Ipsum placeholder text"
url="https://gitlab.gnome.org/World/design/lorem"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd lorem
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson lorem build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
