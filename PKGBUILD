# Maintainer: indyfive11 <203553604+indyfive11@users.noreply.github.com>
pkgname=bastionfw
pkgver=1.5.14
pkgrel=1
pkgdesc="Modular, layered Linux firewall framework with an operator CLI, optional AI analysis layer, and an intelligent setup wizard"
arch=('any')
url="https://github.com/indyfive11/bastion"
license=('MIT')
install=bastionfw.install
depends=('python' 'python-textual' 'nftables')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
  'dnsmasq: LAN DNS/DHCP (L4 edge mode)'
  'unbound: recursive resolver + DNS sinkhole (L4)'
  'wireguard-tools: WireGuard VPN interfaces (L5)'
  'zerotier-one: ZeroTier VPN (L5)'
  'crowdsec: behavioral threat detection (L2; AUR)'
  'conntrack-tools: LAN-client relay verification (L6)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1c13493f01412c908daa751a917d2e23887b650d1a7884744ab4fa059daf154')

build() {
  cd "bastion-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "bastion-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
