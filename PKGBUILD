# Maintainer: Michael Brock <velo dot mcb at gmail dot com>
#
# adapted from package "e1000e-dkms"
pkgname=igb-dkms
_modname=igb
pkgver=5.3.2
pkgrel=1
pkgdesc="Intel igb Ethernet adapter driver (latest version from Intel) (DKMS version)"
license=('GPL')
arch=('i686' 'x86_64')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel [requires at least one set of kernel headers]'
            'linux-ck-headers: build the module against Linux-ck kernel [requires at least one set of kernel headers]'
            'linux-lts-headers: build the module against LTS Arch kernel [requires at least one set of kernel headers]')
install=igb-dkms.install
url='http://sourceforge.net/projects/e1000/'
source=("http://downloads.sourceforge.net/project/e1000/${_modname}%20stable/${pkgver}/${_modname}-${pkgver}.tar.gz"
        'dkms.conf.in'
        'igb-dkms.install')
sha384sums=('2ae45228d196bdd926c010c30b652280f2f42a7c47ee9f1c75d3ec807a858f67212577e69ccb64db6d8ef18adf0a134f'
            'c92e5526d6e9a37b92014c9c8fde284a66aed7bbb14ae2541bb2eaa483f3a2fd7f740afff5fd482e33285ec707bba0cd'
            'dc92e5b599f09bfff6fd310077f049b77a20915718242a074c15ffb7b849844143a7b36633dc5e98b7a3f89f59960f6a')

package() {
  cd ${srcdir}/${_modname}-${pkgver}
  install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  for i in "${srcdir}/${_modname}-${pkgver}/src/"{Makefile,*.c,*.h}; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  done
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
