pkgname=socks-relay
pkgver=1.0.1
pkgrel=4
pkgdesc="Simple socks5 server and relay"
arch=('any')
url="https://github.com/guillon/socks-relay"
license=('MIT')
depends=('python-pysocks')
source=(
  "https://github.com/guillon/socks-relay/archive/refs/tags/v${pkgver}.zip"
  "socks-relay.service"
  "socks-relay.conf")
sha256sums=('59e02359aa61caab1ff4504df64da91d1a43eea419479d82ed530fef26ffb58a'
            '472cd01d44a00ce99d05d6585e3778c92f6582c80093545db8c357df597e581c'
            'e4e835d3542f921c90916f9d2941916ed6328ed8a300586557a37af96d29fbf5')
backup=('etc/default/socks-relay')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $srcdir/socks-relay-${pkgver}/socks-relay.py "${pkgdir}/usr/bin/socks-relay"
    install -Dm644 "socks-relay.service" -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm600 "socks-relay.conf" ${pkgdir}/etc/default/socks-relay
}
