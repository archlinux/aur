# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-gui
pkgver=1.4.5
pkgrel=1
pkgdesc='GNS3 network simulator. Graphical user interface package.'
arch=('any')
url='https://github.com/GNS3/gns3-gui'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=('python-jsonschema' 'gns3-converter' 'python-raven' 'python-psutil' 'python-pyqt5' 'qt5-svg')
# ? 'python-rsa'
optdepends=('gns3-server: GNS3 backend. Manages emulators such as Dynamips, VirtualBox or Qemu/KVM.'
            'dynamips: Cisco router emulator.'
            'xterm: Default terminal emulator for CLI management of virtual instances.'
            'wireshark-gtk: Live packet capture.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz"
        'gns3.desktop')
md5sums=('f8349834fd4e52818f647c680c6b8c02'
         'ac6ba60be0a1cb7fc965d1a105e431d5')

prepare() {
  sed -i 's/gns3-net-converter>=1.3.0/gns3-converter>=1.2.0/g' ${srcdir}/${pkgname}-${pkgver}/setup.py
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/gns3.desktop ${pkgdir}/usr/share/applications/gns3.desktop
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/images/gns3_icon_256x256.png ${pkgdir}/usr/share/pixmaps/gns3.png
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
