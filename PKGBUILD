# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Hojjat Ali Mohammadi <safeith@gmail.com>

pkgname=cyberghostvpn
pkgver=1.4.1
pkgrel=2
pkgdesc="CyberGhost VPN"
url="https://www.cyberghostvpn.com"
arch=(any)
license=(custom:cyberghostvpn)
depends=(
  curl
  openvpn
  wireguard-tools
  systemd-resolvconf
)
makedepends=(zip)

source=("https://download.cyberghostvpn.com/linux/cyberghostvpn-fedora-32-${pkgver}.zip")
sha256sums=('772d3278eaffa7dd5f91a5d988efbf0ff6e0521188cfb5445c14207d3172ee44')

_archive="${pkgname}-fedora-32-${pkgver}"

package() {
  cd "$_archive"

  install -Dm 755 cyberghost/cyberghostvpn "$pkgdir/opt/cyberghost/cyberghostvpn"
  install -Dm 755 cyberghost/update-systemd-resolved "$pkgdir/opt/cyberghost/update-systemd-resolved"

  install -Dm 644 cyberghost/certs/openvpn/ca.crt "$pkgdir/opt/cyberghost/certs/openvpn/ca.crt"
  install -Dm 644 cyberghost/certs/openvpn/client.crt "$pkgdir/opt/cyberghost/certs/openvpn/client.crt"
  install -Dm 644 cyberghost/certs/openvpn/client.key "$pkgdir/opt/cyberghost/certs/openvpn/client.key"

  install -dm 755 $pkgdir/usr/bin
  ln -s /opt/cyberghost/cyberghostvpn $pkgdir/usr/bin/cyberghostvpn
  ln -s /opt/cyberghost/update-systemd-resolved $pkgdir/usr/bin/update-systemd-resolved
}
