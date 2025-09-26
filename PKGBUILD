# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=nimbus-beacon-node
pkgver=25.9.1
pkgrel=1
pkgdesc="Nimbus Ethereum consensus client (beacon node)"
arch=('x86_64')
url="https://github.com/status-im/nimbus-eth2"
license=('MIT' 'Apache')
depends=()
makedepends=('base-devel' 'git' 'git-lfs')
provides=('nimbus-beacon-node')
conflicts=('nimbus-beacon-node-git' 'nimbus-beacon-node-bin')
options=(!strip !buildflags)
source=("nimbus-eth2::git+https://github.com/status-im/nimbus-eth2.git#tag=v${pkgver}?submodules")
sha256sums=('dfed95ee0c46fd57154c246f2d6552c39a2bffddda5e1b307078c51eca1e83cd')

prepare() {
  cd "$srcdir/nimbus-eth2"
  git lfs install
  git lfs pull
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/nimbus-eth2"
  make -j4 nimbus_beacon_node
}

package() {
  cd "$srcdir/nimbus-eth2"
  install -Dm755 build/nimbus_beacon_node "$pkgdir/usr/bin/nimbus_beacon_node"
}
