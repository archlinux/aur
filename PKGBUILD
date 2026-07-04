# Maintainer: Tomasz Cebula <tomasz.cebula@gmail.com>

pkgname=nft-blackhole
pkgver=1.4.1
pkgrel=1
pkgdesc='Script / Daemon to blocking IP in nftables by country and black lists'
arch=('any')
url='https://github.com/tomasz-c/nft-blackhole'
license=('MIT')
depends=('nftables' 'python-yaml')
backup=('etc/nft-blackhole.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tomasz-c/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ba3489a0b2977463e03acda840d991bec696d71e7829204fc2d0c1254d8e0ddd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Script
  install -Dm755 nft-blackhole.py "$pkgdir/usr/bin/nft-blackhole.py"
  # Template
  install -Dm644 nft-blackhole.template "$pkgdir/usr/share/nft-blackhole/nft-blackhole.template"
  # Config in yaml
  install -Dm644 nft-blackhole.conf "$pkgdir/etc/nft-blackhole.conf"
  # Systemd unit files
  install -Dm644 packaging/systemd/nft-blackhole.service "$pkgdir/usr/lib/systemd/system/nft-blackhole.service"
  install -Dm644 packaging/systemd/nft-blackhole-reload.service "$pkgdir/usr/lib/systemd/system/nft-blackhole-reload.service"
  install -Dm644 packaging/systemd/nft-blackhole-reload.timer "$pkgdir/usr/lib/systemd/system/nft-blackhole-reload.timer"
}
