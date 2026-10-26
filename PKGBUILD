# Maintainer: executter <executter at hotmail dot com>

pkgname=ocsinventory-agent3-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Hardware and software inventory agent for OCS Inventory server 3.x"
arch=('x86_64')
url="https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework"
license=('GPL-3.0-or-later')
depends=('bash' 'ca-certificates' 'coreutils' 'dmidecode' 'glibc'
         'inetutils' 'iproute2' 'systemd' 'tar' 'util-linux' 'which')
optdepends=('cups: printer inventory'
            'libvirt: libvirt virtual machine inventory'
            'pciutils: controller, sound and video card inventory'
            'smartmontools: disk model, firmware and serial numbers'
            'upower: battery inventory'
            'usbutils: USB device inventory'
            'v4l-utils: monitor inventory'
            'virtualbox: VirtualBox virtual machine inventory')
provides=('ocsinventory-agent3')
conflicts=('ocsinventory-agent3')
options=('!strip' '!debug')
backup=('etc/ocsinventory-agent/config.json')
source=("$url/releases/download/$pkgver/OCSInventory-Agent-Setup-Linux-Deb-$pkgver.tar.xz"
        'config.json')
sha256sums=('05b00d9b1c599c1390eab80195de0a88bf7151c9dff626d507ea5764545dd5d5'
            '3d1a7939a86f46a01efc14de561371ca63ad5228256585c37139b0032f603027')

prepare() {
  sed -i '/^PIDFile=/d' OCSInventory-Agent-Linux-Deb-Setup/ocsinventory-agent.service
}

package() {
  install -Dm600 config.json "$pkgdir/etc/ocsinventory-agent/config.json"

  cd OCSInventory-Agent-Linux-Deb-Setup
  install -Dm755 ocsinventory-cli "$pkgdir/usr/bin/ocsinventory-cli"
  install -Dm644 ocsinventory-agent.service \
    "$pkgdir/usr/lib/systemd/system/ocsinventory-agent3.service"
}
