# Maintainer: Samueru-sama xdglawyer@outlook.com

pkgname=libdecor-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="Client-side decorations for Wayland, in pure Rust without GTK/D-Bus dependencies"
arch=('x86_64' 'aarch64')
url=https://github.com/QaidVoid/libdecor-rs
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'rust' 'git')
provides=('libdecor' 'libdecor-0.so')
conflicts=('libdecor')
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/"$pkgname"
  cargo build --release -p libdecor-c
}

package() {
  cd "$srcdir"/"$pkgname"
  install -Dm755 ./target/release/libdecor_0.so "$pkgdir"/usr/lib/libdecor-0.so.0
  ln -s libdecor-0.so.0 "$pkgdir"/usr/lib/libdecor-0.so
}
