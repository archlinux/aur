# Maintainer: Bangkah <mdhyaulatha@gmail.com>
# Keywords: ids, ips, firewall, security, network, athaguard, intrusion-detection, prevention, monitoring, python
pkgname=athaguard
desc="AthaGuard is a professional, modular Intrusion Detection and Prevention System (IDPS) for Linux. Features log analysis, real-time monitoring, Suricata-like network sniffer, and advanced firewall CLI. Suitable for research, education, and production environments."
pkgver=1.0.1
pkgrel=1
arch=("any")
url="https://github.com/Bangkah/athaguard"
license=("MIT")
depends=(
  'python' 'python-scapy' 'python-fastapi' 'python-uvicorn' 'python-jinja' 'python-watchdog' 'python-notify2'
  'python-pandas' 'python-numpy' 'python-scikit-learn' 'python-requests' 'python-pyotp' 'python-passlib'
  'python-jose' 'python-multipart' 'iptables' 'nftables' 'ufw'
)
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


build() {
  cd "$srcdir/athaguard-$pkgver"
  python setup.py build
}


package() {
  cd "$srcdir/athaguard-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Symlink professional commands
  install -d "$pkgdir/usr/bin"
  ln -s /usr/bin/athaguard-ids "$pkgdir/usr/bin/athaguard"
  ln -s /usr/bin/athaguard-ids "$pkgdir/usr/bin/athaguard-ids"
  ln -s /usr/bin/athaguard-ips "$pkgdir/usr/bin/athaguard-ips"
  ln -s /usr/bin/athaguard-net "$pkgdir/usr/bin/athaguard-net"
  ln -s /usr/bin/athaguard-fw "$pkgdir/usr/bin/athaguard-fw"
}
