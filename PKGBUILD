# Maintainer: Abdullah Koyuncu <wisewebworks@outlook.com>
pkgname='youtube-chat-rs-git'
pkgver=0.1.0
pkgrel=2
pkgdesc='Fetch YouTube live chat messages from terminal'
arch=('x86_64')
url="https://github.com/efekrskl/youtube-chat-rs"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git' 'clang')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

options=(!lto)

pkgver() {
  cd "$pkgname"
  grep -m1 '^version' Cargo.toml \
    | sed 's/version *= *"\(.*\)"/\1/'
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm0755 target/release/youtube-chat-rs \
    "$pkgdir/usr/bin/youtube-chat-rs"
}
