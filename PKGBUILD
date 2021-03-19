# Maintainer: Tomasz Cebula <tomasz.cebula@gmail.com>

pkgname=nft-blackhole
pkgver=0.1.1
pkgrel=3
pkgdesc='Script / Daemon to blocking IP in nftables by country and black lists'
arch=('any')
url='https://github.com/tomasz-c/nft-blackhole'
license=('MIT')
depends=('systemd' 'nftables' 'python' 'python-yaml')
makedepends=('git')
backup=('etc/nft-blackhole.conf')
source=('git+https://github.com/tomasz-c/nft-blackhole.git')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  # Script
  install -Dm755 nft-blackhole.py "$pkgdir/usr/bin/nft-blackhole.py"
  # Template
  install -Dm644 nft-blackhole.template "$pkgdir/usr/share/nft-blackhole/nft-blackhole.template"
  # Config in yaml
  install -Dm644 nft-blackhole.conf "$pkgdir/etc/nft-blackhole.conf"
  # Systemd unit files
  install -Dm644 nft-blackhole.service "$pkgdir/usr/lib/systemd/system/nft-blackhole.service"
  install -Dm644 nft-blackhole-reload.service "$pkgdir/usr/lib/systemd/system/nft-blackhole-reload.service"
  install -Dm644 nft-blackhole-reload.timer "$pkgdir/usr/lib/systemd/system/nft-blackhole-reload.timer"
}
