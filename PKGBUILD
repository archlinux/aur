#!/usr/bin/env bash
# shellcheck disable=2034
# Maintainer: Cezary Drożak <czarek at drozak dot net>
_pkgver=1.0.0
pkgname=easywatch
tardir="$pkgname-v$_pkgver"
pkgver=${_pkgver//-/_}
pkgrel=1
provides=("$pkgname=$pkgver")
pkgdesc="A simple and easy to use tool to run command when files change"
arch=('i686' 'x86_64')
url="https://sr.ht/~cdrozak/easywatch/"
license=('GPL')
makedepends=('cargo' 'git')
source=("$pkgname.tar.gz::https://git.sr.ht/~cdrozak/easywatch/archive/v$_pkgver.tar.gz")
md5sums=('dc3d572a7096850a7e6fea0ca7a98eeb')

build() {
  # shellcheck disable=2154,2164
  cd "$srcdir/$tardir"
  cargo build --release
}

package() {
  # shellcheck disable=2164
  cd "$srcdir/$tardir"

  # shellcheck disable=2154
  install -Dm755 target/release/easywatch "$pkgdir/usr/bin/ewatch"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 ft=sh et
