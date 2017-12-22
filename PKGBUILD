# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=gns3-gui
pkgname=${_pkgname}-git
pkgver=2.1.1
pkgrel=1
pkgdesc='GNS3 network simulator. Graphical user interface package.'
arch=('any')
url="https://github.com/GNS3/${_pkgname}"
license=('GPL3')
groups=('gns3')
provides=('gns3-gui')
replaces=('gns3-gui')
conflicts=('gns3-gui')
makedepends=('python-setuptools')
depends=('python-jsonschema>=2.4.0' 'python-raven>=5.23.0' 'python-psutil>=2.2.1' 'python-pyqt5' 'qt5-websockets')
optdepends=('gns3-server-git: GNS3 backend. Manages emulators such as Dynamips, VirtualBox or Qemu/KVM.'
            'dynamips: Cisco router emulator.'
            'xterm: Default terminal emulator for CLI management of virtual instances.'
            'wireshark-gtk: Live packet capture.')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${_pkgname}/archive/v${pkgver}.tar.gz"
        'gns3.desktop')
md5sums=('a9e54f7d69894a4fef3ac9d0568b62f0'
         'ac6ba60be0a1cb7fc965d1a105e431d5')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root=${pkgdir} --optimize=1
    install -Dm644 ${srcdir}/gns3.desktop ${pkgdir}/usr/share/applications/gns3.desktop
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/resources/images/gns3_icon_256x256.png ${pkgdir}/usr/share/pixmaps/gns3.png
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
