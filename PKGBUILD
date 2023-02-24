# Maintainer: Mark Wagie <mark dot wagie at tutantota dot com>
pkgname=paleta
pkgver=0.30
pkgrel=1
pkgdesc="Extract the dominant colors from any image."
arch=('x86_64')
url="https://github.com/nate-xyz/paleta"
license=('GPL3')
depends=('libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
options=('!lto')
_commit=85d754ed5d1e0e8e40dcd19c1914f638f45dbf0d  # v0.3.0
source=("git+https://github.com/nate-xyz/paleta.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package () {
  meson install -C build --destdir "$pkgdir"
}
