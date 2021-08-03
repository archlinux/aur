# Maintainer: Vince <vince@ultrabanana.net>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Jan Baudisch <dev@baudisch.xyz>
pkgname=wxwabbitemu-git
pkgver=r140.7b9ef9d
pkgrel=1
epoch=1
pkgdesc="A cross-platform TI-8x emulator based on Wabbitemu"
arch=("x86_64")
url="https://github.com/alberthdev/wxwabbitemu"
license=("GPL2")
depends=("wxgtk2")
makedepends=("git")
source=("$pkgname::git+https://github.com/alberthdev/wxwabbitemu.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
