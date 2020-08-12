# Maintainer: Jonathan Pettersson <anders.jonathan.p@gmail.com>
pkgname=contain
pkgver=0.3.1
pkgrel=1
pkgdesc="An experimental CLI tool that transparently runs your development tools inside docker containers"
url="https://github.com/jpettersson/contain"
license=('GNU GPLv3')
arch=('x86_64')
depends=(docker)
makedepends=(cargo git)
_commit=4638cd6ccd8bc2be1dc9be48d9514c078a30b6ad  # tags/0.3.1
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