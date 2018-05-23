# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=systemd-named-netns
pkgver=20180124
pkgrel=1
pkgdesc="Use named netns with systemd services!"
license=('GPL3')
depends=('systemd' 'iproute2')
optdepends=('dhclient: when using dynamically assigned IP')
arch=('any')
backup=('etc/default/netns')
url="https://github.com/Jamesits/systemd-named-netns"
source=("https://github.com/Jamesits/${pkgname}/archive/upstream/0_${pkgver}.tar.gz")
sha256sums=('ca0324bbe4501e8e9b706fedaea55165ce3fae7d1ea65797b950538ab847c6d7')

package() {
  cd "${pkgname}-upstream-0_${pkgver}"
  install -d "${pkgdir}"/usr/lib/systemd/system "${pkgdir}"/etc/default "${pkgdir}"/usr/bin
  install -Dm644 services/netns@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-bridge@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-nat@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 services/netns-tunnel@.service "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 configs/netns "${pkgdir}"/etc/default/
  install -Dm755 scripts/chnetns "${pkgdir}"/usr/bin/
  install -Dm755 scripts/netnsinit "${pkgdir}"/usr/bin/
}
