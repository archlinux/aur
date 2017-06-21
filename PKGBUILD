# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=2.0.3
pkgrel=1
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

md5sums=('63ae2f4c276aa5f6bf07f38b46372f0f'
         'f7a8f3128a903179c5f17a6c242b3cf9')

prepare() {
  sed -i 's/yarl>=0.9.8,<0.10/yarl>=0.10.2,<0.11/g' ${srcdir}/${pkgname}-${pkgver}/requirements.txt
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
