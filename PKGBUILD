# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: codic12 <https://github.com/codic12>

_pkgbase='worm'
pkgname='worm-git'
pkgdesc="A floating, tag-based window manager written in Rust"
pkgver=0.1.0.11.g4b80340
pkgrel=1
arch=('x86_64')
url="https://github.com/codic12/worm"
license=('MIT')
makedepends=('cargo' 'git')
depends=('xorg-server')
source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
  cd "$_pkgbase"
  cargo build --release --locked
}

package() {
  cd "$_pkgbase"

  install -D -m755 "target/release/worm" "$pkgdir/usr/bin/worm"
  install -D -m755 "target/release/wormc" "$pkgdir/usr/bin/wormc"
}
