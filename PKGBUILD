# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=chromatic
pkgver=0.1.2
pkgrel=2   
pkgdesc="Fine-tune your instruments"
url="https://github.com/nate-xyz/chromatic"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('libadwaita' 'libpulse' 'portaudio')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
_commit=fe9d34e3cb30a045b95aa76f8cc4e3193903e262
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
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
