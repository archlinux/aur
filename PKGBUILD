# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=systemd-named-netns
pkgver=1.20190822
pkgrel=1
pkgdesc="Use named netns with systemd services!"
license=('GPL3')
depends=('systemd' 'iproute2')
optdepends=('iptables: for default NAT config' 'dhclient: when using dynamically assigned IP')
arch=('any')
backup=('etc/default/netns')
url="https://github.com/Jamesits/systemd-named-netns"
source=("https://github.com/Jamesits/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('361e611216056868107926436dbebeafc002ce33189b9dc261f8562d2a68fc39')

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}"/usr/lib/systemd/system "${pkgdir}"/etc/default "${pkgdir}"/usr/bin
  install -Dm644 services/netns@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-bridge@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-nat@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-tunnel@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 configs/netns "${pkgdir}"/etc/default/
  install -Dm755 scripts/chnetns "${pkgdir}"/usr/bin/
  install -Dm755 scripts/netnsinit "${pkgdir}"/usr/bin/
}
