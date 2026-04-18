# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=maltrail
pkgver=1.3
pkgrel=1
pkgdesc="Malicious traffic detection system utilizing publicly available blacklists"
arch=('any')
url="https://github.com/stamparm/maltrail"
license=('MIT')
depends=('python')
optdepends=('python-pcapy: for sensor mode (packet capture)')
makedepends=()
backup=('etc/maltrail/maltrail.conf')
install=maltrail.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/stamparm/maltrail/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d0db9546f099a3450f59dc561b69882eef83015dcd4bbd27300d102fd0d9c547')

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir/opt/maltrail"
  cp -a core html misc plugins trails thirdparty sensor.py server.py "$pkgdir/opt/maltrail/"

  install -Dm644 maltrail.conf "$pkgdir/etc/maltrail/maltrail.conf"
  ln -sf /etc/maltrail/maltrail.conf "$pkgdir/opt/maltrail/maltrail.conf"

  install -Dm644 maltrail-sensor.service "$pkgdir/usr/lib/systemd/system/maltrail-sensor.service"
  install -Dm644 maltrail-server.service "$pkgdir/usr/lib/systemd/system/maltrail-server.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
