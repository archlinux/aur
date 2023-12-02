# Maintainer: Craggles <craggles17@gmail.com>
# Source: https://www.virtualhere.com/client_service

pkgname=virtualhere-client
pkgver=5.5.6
pkgrel=1
pkgdesc="VirtualHere USB Client for Linux Desktop"
arch=("i686" "x86_64")
url="https://www.virtualhere.com/usb_server_software"
license=("BSD")
optdepends=("avahi: systemd unit support")
provides=("virtualhereclient")
conflicts=("virtualhereclient")
source=("https://www.virtualhere.com/sites/default/files/usbclient/scripts/virtualhereclient.service"
       "https://www.virtualhere.com/sites/default/files/usbclient/vhclientx86_64")
md5sums=('SKIP'
	'SKIP')

pkgver() {
    chmod +x "${srcdir}/vhclientx86_64"
    "${srcdir}/vhclientx86_64" --help 2>&1 | head -n 1| sed 's/.[^0-9]*\([0-9]\+[\.0-9]*\),.*/\1/'
}

package() {
    install -Dm755 vhclientx86_64              "${pkgdir}/usr/bin/vhclientx86_64"
    install -Dm644 virtualhereclient.service "${pkgdir}/etc/systemd/system/virtualhereclient.service"
}
