# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=2.0.3
pkgrel=3
pkgdesc='GNS3 network simulator. Server package.'
arch=('any')
url='https://github.com/GNS3/gns3-server'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=('python-jsonschema' 'python-aiohttp-135' 'python-aiohttp-cors-051' 'python-yarl' 'python-jinja' 'python-raven' 'python-psutil' 'python-zipstream' 'python-typing')
optdepends=('dynamips: Cisco router emulator.'
            'gns3-gui: graphical user interface for GNS3 server.'
            'vboxwrapper: VirtualBox wrapper for GNS3.'
            'iouyap: Bridge IOU to UDP, TAP and Ethernet.'
            'qemu: Used by GNS3 to run Cisco ASA, PIX and IDS.'
            'vpcs: Simple PC emulation for basic network operations.'
            'ubridge: Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}@.service")

sha256sums=('949f2fbf324ce21d309666aa7688d062086474ab28d6cc4dc222e8b09fedb4ec'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f')

prepare() {
  sed -i 's/yarl>=0.9.8,<0.10/yarl>=0.9.8/g' ${srcdir}/${pkgname}-${pkgver}/requirements.txt
#  sed -i 's/aiohttp>=1.3.5,<=1.4.0/aiohttp>=1.3.5/g' ${srcdir}/${pkgname}-${pkgver}/requirements.txt
#  sed -i 's/aiohttp-cors==0.5.1/aiohttp-cors>=0.5.1/g' ${srcdir}/${pkgname}-${pkgver}/requirements.txt
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ${srcdir}/${pkgname}@.service ${pkgdir}/usr/lib/systemd/system/${pkgname}@.service
}

# vim:set ts=2 sw=2 et:
