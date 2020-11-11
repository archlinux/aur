pkgname=openvpn-update-systemd-resolved
pkgver=1.3.0
pkgrel=2
pkgdesc="OpenVPN systemd-resolved Updater"
arch=("any")
url="https://github.com/jonathanio/update-systemd-resolved"
license=("GPL")
depends=("openvpn" "bash" "iproute2" "systemd>229")
source=("https://github.com/jonathanio/update-systemd-resolved/archive/v${pkgver}.tar.gz"
        'openvpn-update-systemd-resolved.install'
        'openvpn-update-systemd-resolved.rules')
install=$pkgname.install
sha256sums=('ee88c1862cb7d197adfcb0e088530993e092f7035fdd95693827d6526f2817af'
            '4905c25c753bd7d3c9323baf67ffdf4d1dca5109df92fec1e853a7a2e7e0ab2b'
            'b8a4d95c950a0efd12a3270a5f14077710adeff1a82cad74df8bd254a00c1169')

package() {
  install -D -m644 openvpn-update-systemd-resolved.rules "${pkgdir}/etc/polkit-1/rules.d/00-openvpn-systemd-resolved.rules"

  cd $srcdir/update-systemd-resolved-${pkgver}
  install -D -m755 update-systemd-resolved "${pkgdir}/etc/openvpn/scripts/update-systemd-resolved"
  install -D -m644 update-systemd-resolved.conf "${pkgdir}/etc/openvpn/scripts/update-systemd-resolved.conf"
}

# vim:set ts=2 sw=2 et:
