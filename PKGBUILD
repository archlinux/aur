# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=pmbs
pkgver=0.1.0
pkgrel=1
pkgdesc="Make btrfs snapshot (every minute), and auto clean"
arch=('x86_64')
url="https://crates.io/crates/pmbs"
license=('MIT')
depends=('btrfs-progs>=6.19')
makedepends=('rust>=1:1.93')
conflicts=('pmbs-bin')
optdepends=('rsync: send snapshot to remote machine')
source=('pmbs.tar.gz::https://crates.io/api/v1/crates/pmbs/0.1.0/download')
sha256sums=('7b1ff7a2dbc387810a07160ed305f022265746a7439106f82f77ec34b098f46d')

build() {
  cd "${srcdir}/pmbs-0.1.0"

  cargo build --release
}

package() {
  cd "${srcdir}/pmbs-0.1.0"

  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/pmbs

  make "FROM=." "TO=${pkgdir}" install-config
}
