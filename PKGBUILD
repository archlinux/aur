# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=key-rack
pkgver=0.3.0
pkgrel=1
pkgdesc="View and edit keys stored by apps."
arch=('x86_64')
url="https://gitlab.gnome.org/sophie-h/key-rack"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
_commit=0fdfa4587262408f6f20eebc2c47bcadfeaa665c  # 0.3.0
source=("git+https://gitlab.gnome.org/sophie-h/key-rack.git#commit=${_commit}")
sha256sums=('SKIP')

#pkgver() {
#  cd "$pkgname"
#  git describe --tags | sed 's/-/+/g'
#}

prepare() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson . build
  meson compile -C build
}

package() {
  cd "$pkgname"
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
