# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bootstrap-dht-git
pkgver=r122.679c661
pkgrel=1
pkgdesc="Bittorrent DHT bootstrap server"
arch=('i686' 'x86_64')
url="https://github.com/bittorrent/bootstrap-dht"
license=('MIT')
depends=('glibc' 'boost-libs')
makedepends=('git' 'boost-build')
provides=('bootstrap-dht')
conflicts=('bootstrap-dht')
source=("git+https://github.com/bittorrent/bootstrap-dht.git")
sha256sums=('SKIP')


pkgver() {
  cd "bootstrap-dht"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "bootstrap-dht"

  b2 "$MAKEFLAGS" release
}

check() {
  cd "bootstrap-dht/tests"

  b2 "$MAKEFLAGS" release
}

package() {
  cd "bootstrap-dht"

  install -d "$pkgdir/usr/bin/"
  install -m755 "dht-bootstrap" "$pkgdir/usr/bin/"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/bootstrap-dht/LICENSE"
}
