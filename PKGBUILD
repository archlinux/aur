# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=pmbs
pkgver=0.1.0a4
pkgrel=1
pkgdesc="Make btrfs snapshot (every minute), and auto clean"
arch=('x86_64')
url="https://crates.io/crates/pmbs"
license=('MIT')
depends=('btrfs-progs>=6.16')
makedepends=('rust>=1:1.89')
conflicts=('pmbs-bin')
optdepends=('rsync: send snapshot to remote machine')
source=('pmbs.tar.gz::https://crates.io/api/v1/crates/pmbs/0.1.0-a4/download')
sha256sums=('1714bbe8ce2b1065c871a2c92b6853c61cbca75f01251b26c5492a84faa2e4cc')

build() {
  cd "${srcdir}/pmbs-0.1.0-a4"

  cargo build --release
}

package() {
  cd "${srcdir}/pmbs-0.1.0-a4"

  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/pmbs

  make "FROM=." "TO=${pkgdir}" install-config
}
