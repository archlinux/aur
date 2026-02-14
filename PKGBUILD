# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=nimbus-beacon-node
pkgver=26.2.0
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
sha256sums=('08b67a6c75d702c9610df0747dc0546b95a66f12e2e91658a0d9144ab097fd80')

prepare() {
  cd "$srcdir/nimbus-eth2"
  git lfs install --local
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
