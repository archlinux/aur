# Maintainer: Jan Baudisch <dev@baudisch.xyz>
pkgname=wxwabbitemu-git
pkgver=48325ca
pkgrel=1
pkgdesc="A cross-platform TI-8x emulator based on Wabbitemu"
arch=("x86_64")
url="https://github.com/alberthdev/wxwabbitemu"
license=("unknown")
depends=("wxgtk3")
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
}
