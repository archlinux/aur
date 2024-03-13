# Maintainer : Barfin
# Previous Maintainer: Michael Brock <velo dot mcb at gmail dot com>
#
# adapted from package "e1000e-dkms"

pkgname=e1000e-dkms-lts515
_modname=e1000e
pkgver=3.8.7
pkgrel=3
pkgdesc="Intel e1000e Ethernet adapter driver (latest version from Intel) (DKMS version) for Linux LTS 5.15.x"
license=('GPL')
arch=('any')
depends=('dkms')
optdepends=('linux-lts515-headers: build the module against Arch kernel [requires at least one set of kernel headers]')
install=e1000e-dkms-lts515.install
url='http://sourceforge.net/projects/e1000/'
source=("http://downloads.sourceforge.net/project/e1000/${_modname}%20historic%20archive/${pkgver}/${_modname}-${pkgver}.tar.gz"
        'dkms.conf.in'
        'e1000e-3.8.7_coalesce_interface.patch')
sha256sums=('63bad49d2d37c975e5f5f88689c953eeb9be37b0ef035945c79820a95f480f11'
            'ebf49307a6773034c551755238221b36b0bd88990f897bf80716ec8e0c95b029'
            '6b75851d452ea9e3ae7d074a70f8defff0c9dc95df33a06bc68b73fa02797d8d')

package() {
  cd ${srcdir}/${_modname}-${pkgver}
  patch -Np1 < ${srcdir}/e1000e-3.8.7_coalesce_interface.patch
  install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  for i in "${srcdir}/${_modname}-${pkgver}/src/"*; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  done
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
