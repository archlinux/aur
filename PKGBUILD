# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=gns3-server
pkgname=${_pkgname}-git
pkgver=2.1.6
pkgrel=1
pkgdesc='GNS3 network simulator. Server package.'
arch=('any')
url="https://github.com/GNS3/${_pkgname}"
license=('GPL3')
groups=('gns3')
replaces=('gns3-server')
provides=('gns3-server')
conflicts=('gns3-server')
makedepends=('python-setuptools')
depends=('python-jsonschema>=2.4.0' 'python-jinja>=2.7.3' 'python-raven>=5.23.0' 'python-psutil>=3.0.0' 'python-zipstream-gns3' 'python-typing-gns3' 'python-yarl-gns3' 'python-aiohttp-gns3' 'python-aiohttp-cors-gns3' 'python-prompt_toolkit' 'python-async-timeout-gns3')
optdepends=('dynamips: Cisco router emulator.'
            'qemu: Used by GNS3 to run Cisco ASA, PIX and IDS.'
            'vpcs: Simple PC emulation for basic network operations.'
            'ubridge: Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
            'gns3-gui: graphical user interface for GNS3 server.'
)
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${_pkgname}/archive/v${pkgver}.tar.gz"
        "${_pkgname}@.service")
sha256sums=('a292be8f0a4ea970e43ea980383f046b2417e7412ff00e171a44453bde8f3463'
            'd145c7a4b7163aecd91b71a0769130d62beb5f4381fe5437774f6b4477a3fa48')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python3 setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
  install -Dm644 ${srcdir}/${_pkgname}@.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service
}
