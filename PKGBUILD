# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=2.1.8
pkgrel=2
pkgdesc='GNS3 network simulator. Server package.'
arch=('any')
url='https://github.com/GNS3/gns3-server'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=('python-jsonschema' 'python-aiohttp-gns3' 'python-aiohttp-cors-gns3' 'python-yarl-gns3' 'python-jinja' 'python-raven' 'python-psutil' 'python-zipstream' 'python-prompt_toolkit' 'python-async-timeout-gns3')
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

sha256sums=('8bccf2ba16832743e0743f11fe19f506172af07c68d2eae156ea1b946415b1a0'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i '/^typing/d' requirements.txt
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ${srcdir}/${pkgname}@.service ${pkgdir}/usr/lib/systemd/system/${pkgname}@.service
}

# vim:set ts=2 sw=2 et:
