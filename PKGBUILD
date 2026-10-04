# Maintainer: Tomasz Cebula <tomasz.cebula@gmail.com>

pkgname=nft-blackhole
pkgver=1.5.0
pkgrel=1
pkgdesc='Script / Daemon to blocking IP in nftables by country and black lists'
arch=('any')
url='https://github.com/tomasz-c/nft-blackhole'
license=('MIT')
depends=('nftables' 'python-yaml')
backup=('etc/nft-blackhole/config.yaml')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tomasz-c/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3ba0849135bbcce0a078759cedd316a2a091363b278065b832cdccd461476922')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Script
  install -Dm755 nft-blackhole.py "$pkgdir/usr/bin/nft-blackhole.py"
  # Template
  install -Dm644 nft-blackhole.template "$pkgdir/usr/share/nft-blackhole/nft-blackhole.template"
  # Config in yaml
  install -Dm644 config.yaml "$pkgdir/etc/nft-blackhole/config.yaml"
  # Systemd unit files
  install -Dm644 packaging/systemd/nft-blackhole.service "$pkgdir/usr/lib/systemd/system/nft-blackhole.service"
  install -Dm644 packaging/systemd/nft-blackhole-reload.service "$pkgdir/usr/lib/systemd/system/nft-blackhole-reload.service"
  install -Dm644 packaging/systemd/nft-blackhole-reload.timer "$pkgdir/usr/lib/systemd/system/nft-blackhole-reload.timer"
}
