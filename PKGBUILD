# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=aircast-ap-git
pkgver=1.0.2.r0.gc4b8e6b
pkgrel=1
pkgdesc="Modern GTK4 + Libadwaita Wi-Fi 6 Access Point and Hotspot Manager for Linux (git version)"
arch=('any')
url="https://github.com/9M2PJU/AirCast-AP"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'iw' 'iproute2')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
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
provides=('aircast-ap')
conflicts=('aircast-ap')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 data/aircast-ap.desktop "${pkgdir}/usr/share/applications/aircast-ap.desktop"
    install -Dm644 data/icons/my.hamradio.AirCastAP.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/my.hamradio.AirCastAP.svg"
    install -Dm644 data/icons/aircast-ap-logo.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/my.hamradio.AirCastAP.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
