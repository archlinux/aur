# Maintainer: Jonathan Pettersson <anders.jonathan.p@gmail.com>
pkgname=contain
pkgver=0.2.0
pkgrel=1
pkgdesc="An experimental CLI tool that transparently runs your development tools inside docker containers"
url="https://github.com/jpettersson/contain"
license=('GNU GPLv3')
arch=('x86_64')
depends=(docker)
makedepends=(cargo git)
_commit=bc6a07923de73378b91e0c78b0e9445282f20bea  # tags/0.1.0
source=("git+https://github.com/jpettersson/contain#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd $pkgname
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd $pkgname
  cargo build --release --frozen --all-targets
}

package() {
  cd $pkgname
  install -Dt "$pkgdir/usr/bin" target/release/contain
}