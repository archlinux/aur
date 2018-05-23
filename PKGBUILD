# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=2.1.6
pkgrel=1
pkgdesc='GNS3 network simulator. Server package.'
arch=('any')
url='https://github.com/GNS3/gns3-server'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=('python-jsonschema' 'python-aiohttp-gns3' 'python-aiohttp-cors-gns3' 'python-yarl' 'python-jinja' 'python-raven' 'python-psutil' 'python-zipstream' 'python-typing' 'python-prompt_toolkit' 'python-async-timeout-gns3')
optdepends=('dynamips: Cisco router emulator.'
            'gns3-gui: graphical user interface for GNS3 server.'
            'iouyap: Bridge IOU to UDP, TAP and Ethernet.'
            'qemu: Used by GNS3 to run Cisco ASA, PIX and IDS.'
            'vpcs: Simple PC emulation for basic network operations.'
            'ubridge: Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}@.service")

sha256sums=('a292be8f0a4ea970e43ea980383f046b2417e7412ff00e171a44453bde8f3463'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ${srcdir}/${pkgname}@.service ${pkgdir}/usr/lib/systemd/system/${pkgname}@.service
}

# vim:set ts=2 sw=2 et:
