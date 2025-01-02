# Maintainer: Tomasz Cebula <tomasz.cebula@gmail.com>

pkgname=nft-blackhole
pkgver=1.2.1
pkgrel=1
pkgdesc='Script / Daemon to blocking IP in nftables by country and black lists'
arch=('any')
url='https://github.com/tomasz-c/nft-blackhole'
license=('MIT')
depends=('nftables' 'python-yaml')
backup=('etc/nft-blackhole.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tomasz-c/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('42fcc3b8050c865ed00b1da98e4a0ae2654b9b64139102be3b162bfc98b5d146')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
