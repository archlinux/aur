# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=you-have-mail-cli
pkgname=$_pkgname-git
pkgver=r3.b338153
pkgrel=1
pkgdesc="Application to notify you if an email has arrived in your email Account (CLI version) [latest commit]"
url="https://github.com/LeanderBB/you-have-mail-cli"
license=('AGPL3')
arch=('x86_64')
conflicts=("$_pkgname")
provides=("$_pkgname")
makedepends=('cargo' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_pkgname
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

package() {
  cd $_pkgname
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm755 target/release/$_pkgname -t "$pkgdir/usr/bin"
}
