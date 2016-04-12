# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=1.4.5
pkgrel=1
pkgdesc='GNS3 network simulator. Server package.'
arch=('any')
url='https://github.com/GNS3/gns3-server'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=('python-jsonschema' 'python-aiohttp' 'python-jinja' 'python-raven' 'python-psutil')
# ? 'python-netifaces' 'gns3-netifaces' 'python-docker-py' 
optdepends=('dynamips: Cisco router emulator.'
            'vboxwrapper: VirtualBox wrapper for GNS3.'
            'iouyap: Bridge IOU to UDP, TAP and Ethernet.'
            'qemu: Used by GNS3 to run Cisco ASA, PIX and IDS.'
            'vpcs: Simple PC emulation for basic network operations.'
            'ubridge: Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
            'gns3-gui: graphical user interface for GNS3 server.'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}@.service")
md5sums=('35eeb2d32c778b96db9537de095ff181'
         'f602390385890dab14f68e5e0a8cac2d')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ${srcdir}/${pkgname}@.service ${pkgdir}/usr/lib/systemd/system/${pkgname}@.service
}

# vim:set ts=2 sw=2 et:
