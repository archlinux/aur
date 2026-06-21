# Maintainer: indyfive11 <203553604+indyfive11@users.noreply.github.com>
pkgname=bastionfw
pkgver=1.5.3
pkgrel=1
pkgdesc="Modular, layered Linux firewall framework with an operator CLI, optional AI analysis layer, and an intelligent setup wizard"
arch=('any')
url="https://github.com/indyfive11/bastion"
license=('MIT')
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
sha256sums=('c6731477a9debe94d25bdb95c9c5b4bc3959583906af1d260a5ec96efdba4ada')

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
