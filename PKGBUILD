# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=zls
pkgver=0.9.0
pkgrel=2
pkgdesc="A language server for Zig"
arch=('i686' 'x86_64')
url="https://github.com/zigtools/zls"
license=('MIT')
makedepends=('git' 'zig')
source=("git+https://github.com/zigtools/zls.git#tag=$pkgver")
sha256sums=('SKIP')


prepare() {
  cd "zls"

  git submodule update --init --recursive
}

build() {
  cd "zls"

  zig build \
    -Drelease-fast=true
}

check() {
  cd "zls"

  zig build \
    test
}

package() {
  cd "zls"

  zig build \
    install \
    -p "$pkgdir/usr"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/zls"
}
