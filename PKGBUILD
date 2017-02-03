# Maintainer: Michael Brock <velo dot mcb at gmail dot com>
#
# adapted from package "e1000e-dkms"
pkgname=e1000e-dkms
_modname=e1000e
pkgver=3.3.5.3
pkgrel=1
pkgdesc="Intel e1000e Ethernet adapter driver (latest version from Intel) (DKMS version)"
license=('GPL')
arch=('i686' 'x86_64')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel [requires at least one set of kernel headers]'
            'linux-ck-headers: build the module against Linux-ck kernel [requires at least one set of kernel headers]'
            'linux-lts-headers: build the module against LTS Arch kernel [requires at least one set of kernel headers]')
install=e1000e-dkms.install
url='http://sourceforge.net/projects/e1000/'
source=("http://downloads.sourceforge.net/project/e1000/${_modname}%20stable/${pkgver}/${_modname}-${pkgver}.tar.gz"
        'dkms.conf.in')
sha256sums=('38451c1f2c3f5039db33032f721a828a402a4d2e891754e601c30767db1e5faa'
            '635b6c312c18db94e852248e0f5a1238e179ef1c0ebba2cdd0983afdb56efaf4')

package() {
  cd ${srcdir}/${_modname}-${pkgver}
  install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  for i in "${srcdir}/${_modname}-${pkgver}/src/"{Makefile,*.c,*.h}; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  done
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
