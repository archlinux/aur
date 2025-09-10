# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=pmbs
pkgver=0.1.0a3
pkgrel=2
pkgdesc="Make btrfs snapshot (every minute), and auto clean"
arch=('x86_64')
url="https://crates.io/crates/pmbs"
license=('MIT')
depends=('btrfs-progs>=6.16')
makedepends=('rust>=1:1.89')
conflicts=('pmbs-bin')
source=('pmbs.tar.gz::https://crates.io/api/v1/crates/pmbs/0.1.0-a3/download')
sha256sums=('f9b4377bd35b801132959db394625902dfe70fad58c177ca1aa8124d20b28f8b')

build() {
  cd "${srcdir}/pmbs-0.1.0-a3"

  cargo build --release
}

package() {
  cd "${srcdir}/pmbs-0.1.0-a3"

  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/pmbs

  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" systemd-unit/pmbs-snapshot.service
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" systemd-unit/pmbs-snapshot.timer
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" systemd-unit/pmbs-clean.service
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" systemd-unit/pmbs-clean.timer

  install -Dm644 -t "${pkgdir}/etc/pmbs/" etc/home.toml.zh.example
  install -Dm644 -t "${pkgdir}/etc/pmbs/" etc/home.toml.en.example

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
