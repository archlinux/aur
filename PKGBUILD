# Maintainer: InTeaReable <leyn.the.cat@gmail.com>

pkgname=nyado-git
pkgver=0.2.5.r0.gd0e78b0
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
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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