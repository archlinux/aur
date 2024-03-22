# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=papa
pkgver=4.0.0
pkgrel=4
pkgdesc="Mod manager CLI for Northstar"
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
arch=('x86_64')
makedepends=('cargo' 'git')
_commit=fa5617c1a1894d0ffd7aff69ccacfc61f8a600a2
source=("git+$url.git#tag=v$pkgver"
        "git+https://github.com/AnActualEmerald/thermite.git#commit=$_commit")
sha256sums=('SKIP'
            'SKIP')

prepare() {
# Submodule
  rm -d papa/thermite
  ln -s "$srcdir/thermite" papa

# Dependencies
  cd papa
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd papa
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

package() {
  cd papa
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/papa"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/papa"
  install -Dm755 target/release/papa -t "$pkgdir/usr/bin"
}
