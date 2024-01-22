# Maintainer: Michael Brock <velo dot mcb at gmail dot com>
#
# adapted from package "e1000e-dkms"
pkgname=igb-dkms
_modname=igb
pkgver=5.15.6
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
sha384sums=('6b3fdd6c87d168bab857132178e827aa1f6837bf6512d95b749e2ebd738a3a5f5f7200cc474a2ab03c1b06fa06c2d331'
            'a97b64b29ef678436639b3e4c2dc8927cd8c08c46fa0b63e1311a7db46f3f2a76d8043bfd8d6d76452014d04367da8ef'
            'dc92e5b599f09bfff6fd310077f049b77a20915718242a074c15ffb7b849844143a7b36633dc5e98b7a3f89f59960f6a')

package() {
  cd ${srcdir}/${_modname}-${pkgver}
  install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  cp -a src/* "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
