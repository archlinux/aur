# Maintainer: Michael Brock <velo dot mcb at gmail dot com>
#
# adapted from package "e1000e-dkms"
pkgname=igb-dkms
_modname=igb
pkgver=5.3.5.3
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
sha384sums=('d3d9726fa6bd1e60f8fd8aebec96664e64d75b18d401609643f79b7fff2e427af5d139f291f018c2af34c4b6fb8b47ff'
            '480c6a21582fd5f57ffa01708ca062544333e4b95a6e8e343c2424fced2bc498e0dd62c69fd332ed095c0bf0f63d5fbd'
            'dc92e5b599f09bfff6fd310077f049b77a20915718242a074c15ffb7b849844143a7b36633dc5e98b7a3f89f59960f6a')

package() {
  cd ${srcdir}/${_modname}-${pkgver}
  install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  for i in "${srcdir}/${_modname}-${pkgver}/src/"{Makefile,*.c,*.h}; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  done
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
