# Maintainer: Vince <vince@ultrabanana.net>
pkgname=wxwabbitemu-git
pkgver=7b9ef9d
pkgrel=2
pkgdesc="A cross-platform TI-8x emulator based on Wabbitemu"
arch=("x86_64")
url="https://github.com/alberthdev/wxwabbitemu"
license=("custom")
depends=("wxgtk2")
source=("$pkgname::git+https://github.com/alberthdev/wxwabbitemu.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git rev-parse --short HEAD
}

build() {
  # linkage errors when built with optimizations
  export CFLAGS="${CFLAGS//-O*}"
  
  cd "$pkgname"
  make
}

package() {
  install -Dm755 "$pkgname/bin/wxWabbitemu" "$pkgdir/usr/bin/wxwabbitemu"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
