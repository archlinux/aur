# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=pmbs-bin
pkgver=0.1.0a3
pkgrel=1
pkgdesc="Make btrfs snapshot (every minute), and auto clean"
arch=('x86_64')
url="https://github.com/fm-elpac/pmbs"
license=('MIT')
depends=('btrfs-progs>=6.16')
conflicts=('pmbs')
source=('pmbs.tar.gz::https://crates.io/api/v1/crates/pmbs/0.1.0-a3/download'
        'pmbs-x86_64.zip::https://github.com/fm-elpac/pmbs/releases/download/v0.1.0-a3/pmbs-x86_64.zip')
sha256sums=('f9b4377bd35b801132959db394625902dfe70fad58c177ca1aa8124d20b28f8b'
            '21ff4616233fa90f5eb064a2ddfd4f35f3eed53f416a83f2c3a3182e5c6c19ce')

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}/pmbs-0.1.0-a3"

  install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/pmbs"

  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" systemd-unit/pmbs-snapshot.service
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" systemd-unit/pmbs-snapshot.timer
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" systemd-unit/pmbs-clean.service
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" systemd-unit/pmbs-clean.timer

  install -Dm644 -t "${pkgdir}/etc/pmbs/" etc/home.toml.zh.example
  install -Dm644 -t "${pkgdir}/etc/pmbs/" etc/home.toml.en.example

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
