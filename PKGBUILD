# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=pmbs
pkgver=0.1.1
pkgrel=1
pkgdesc="Make btrfs snapshot (every minute), and auto clean"
arch=('x86_64')
url="https://crates.io/crates/pmbs"
license=('MIT')
depends=('btrfs-progs>=7.1')
makedepends=('rust>=1:1.97')
conflicts=('pmbs-bin')
optdepends=('rsync: send snapshot to remote machine')
source=('pmbs-0.1.1.tar.gz::https://github.com/fm-elpac/pmbs/archive/refs/tags/v0.1.1.tar.gz')
sha256sums=('fff051185fe7d014126e3e0aec7e58052b5db26f3205aed70adf2b095faa37c6')

build() {
  cd "${srcdir}/pmbs-0.1.1"

  cargo build --release
}

package() {
  cd "${srcdir}/pmbs-0.1.1"

  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/pmbs

  make "FROM=." "TO=${pkgdir}" install-config
}
