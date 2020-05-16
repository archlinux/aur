# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=systemd-named-netns
pkgver=2.20200516
pkgrel=1
pkgdesc="Use named netns with systemd services!"
license=('GPL3')
depends=('systemd' 'iproute2')
optdepends=('iptables: for default NAT config' 'dhclient: when using dynamically assigned IP')
arch=('any')
backup=('etc/default/netns' 'etc/default/netns-nat')
url="https://github.com/Jamesits/systemd-named-netns"
source=("${pkgname}.${pkgver}.tar.gz::https://github.com/Jamesits/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ea84aa945ce9123472e077fe6cde5702541bfa41fe5e08a414c1a8ff809881d7')

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}"/usr/lib/systemd/system "${pkgdir}"/etc/default "${pkgdir}"/usr/bin
  install -Dm644 services/netns@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-bridge@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-mvbr@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-nat@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-tunnel@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 configs/netns "${pkgdir}"/etc/default/
  install -Dm644 configs/netns-nat "${pkgdir}"/etc/default/
  install -Dm755 scripts/chnetns "${pkgdir}"/usr/bin/
  install -Dm755 scripts/netnsinit "${pkgdir}"/usr/bin/
}
