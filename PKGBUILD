# Maintainer: yunmikun2 <yunmikun2@protonmail.com>
pkgname="dbviz-git"
_gitname=dbviz
pkgver=1.0.1.r4.e69c90e
pkgrel=1
pkgdesc="Visualize your postgresql database schema as dot graph"
arch=('x86_64')
url="https://github.com/yunmikun2/dbviz"
license=('MIT')
depends=()
makedepends=('git' 'cargo' 'rust')
provides=('dbviz')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  cargo build --release
}

package() {
  cd "$_gitname"
  install -D -m755 ./target/release/dbviz "$pkgdir/usr/bin/dbviz"
}
