# Maintainer: InTeaReable <leyn.the.cat@gmail.com>

pkgname=nyado-git
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc="A Rust todo-list manager with TUI (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/LeynTheCat/nyado"
license=('MIT')
provides=("nyado")
conflicts=("nyado")
makedepends=('cargo' 'git')
source=("git+https://github.com/LeynTheCat/nyado.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/nyado"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

prepare() {
  cd "$srcdir/nyado"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo fetch --locked
}

build() {
  cd "$srcdir/nyado"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/nyado"
  install -Dm755 "$CARGO_TARGET_DIR/release/nyado" "$pkgdir/usr/bin/nyado"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}