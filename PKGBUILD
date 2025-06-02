# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=nimbus-beacon-node-git
pkgver=25.5.0.0.gd2f23389a
pkgrel=2
pkgdesc="Nimbus Ethereum consensus client (beacon node) - latest development version"
arch=('x86_64')
url="https://github.com/status-im/nimbus-eth2"
license=('MIT' 'Apache')
depends=()
makedepends=('base-devel' 'git' 'git-lfs')
provides=('nimbus-beacon-node')
conflicts=('nimbus-beacon-node' 'nimbus-beacon-node-bin')
source=("git+https://github.com/status-im/nimbus-eth2.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/nimbus-eth2"
  # Use commit count + short hash format
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/./g' || \
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/nimbus-eth2"
}

build() {
  cd "$srcdir/nimbus-eth2"
  make -j$(nproc) nimbus_beacon_node
}

package() {
  cd "$srcdir/nimbus-eth2"
  install -Dm755 build/nimbus_beacon_node "$pkgdir/usr/bin/nimbus_beacon_node"
}
