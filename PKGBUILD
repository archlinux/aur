# Maintainer: Jonathan Pettersson <anders.jonathan.p@gmail.com>
pkgname=contain
pkgver=0.2.0
pkgrel=2
pkgdesc="An experimental CLI tool that transparently runs your development tools inside docker containers"
url="https://github.com/jpettersson/contain"
license=('GNU GPLv3')
arch=('x86_64')
depends=(docker)
makedepends=(cargo git)
_commit=1cbb469fe240b353d3f84f2ea71ebf69c94c6d78  # tags/0.2.0
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