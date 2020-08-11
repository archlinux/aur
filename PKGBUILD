# Maintainer: Jonathan Pettersson <anders.jonathan.p@gmail.com>
pkgname=contain
pkgver=0.3.0
pkgrel=1
pkgdesc="An experimental CLI tool that transparently runs your development tools inside docker containers"
url="https://github.com/jpettersson/contain"
license=('GNU GPLv3')
arch=('x86_64')
depends=(docker)
makedepends=(cargo git)
_commit=9e4b92d34b6dceb317d993fe62851132355a8742  # tags/0.3.0
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