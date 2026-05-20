#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=home-assistant-tui-git
pkgver=0.1.0.r43.gd2edae7
pkgrel=1
pkgdesc="Terminal UI for Home Assistant (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/home-assistant-tui"
license=('Apache-2.0')
makedepends=('git' 'bun')
provides=('home-assistant-tui')
conflicts=('home-assistant-tui')
options=('!strip')
source=("$pkgname::git+https://github.com/timmo001/home-assistant-tui.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  bun install --frozen-lockfile
  bun build src/index.ts --compile --outfile home-assistant-tui
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 home-assistant-tui "$pkgdir/usr/bin/home-assistant-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
