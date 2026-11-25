# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=aircast-ap
pkgver=1.0.1
pkgrel=1
pkgdesc="Modern GTK4 + Libadwaita Wi-Fi 6 Access Point & Hotspot Manager for Linux (with CLI & RTL8852CU support)"
arch=('any')
url="https://github.com/9M2PJU/AirCast-AP"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'iw' 'iproute2')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
    'hostapd: Full Wi-Fi 6 (802.11ax) / 80 MHz / WPA3 AP backend'
    'dnsmasq: DHCP and DNS server for hostapd backend'
    'networkmanager: Quick nmcli hotspot backend'
    'nftables: NAT internet sharing'
    'python-qrcode: Live Wi-Fi QR code card in GUI'
    'python-pillow: QR code image rendering in GUI'
    'qrencode: Terminal Wi-Fi QR code output (--qr)'
    'polkit: Graphical privilege elevation (pkexec)'
    'rtl8852cu-9m2pju-dkms: Realtek RTL8852CU/RTL8832CU Wi-Fi 6 USB driver'
)
conflicts=('aircast-ap-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e9347f87db5439d993c981d269e8e32540012a0afd56357a999245cee6183ad')

build() {
    cd "AirCast-AP-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "AirCast-AP-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 data/aircast-ap.desktop "${pkgdir}/usr/share/applications/aircast-ap.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
