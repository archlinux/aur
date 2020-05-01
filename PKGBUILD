# Maintainer: Michael Brock <velo dot mcb at gmail dot com>
#
# adapted from package "e1000e-dkms"

pkgname=e1000e-dkms
_modname=e1000e
pkgver=3.8.4
pkgrel=2
pkgdesc="Intel e1000e Ethernet adapter driver (latest version from Intel) (DKMS version)"
license=('GPL')
arch=('any')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel [requires at least one set of kernel headers]'
            'linux-ck-headers: build the module against Linux-ck kernel [requires at least one set of kernel headers]'
            'linux-lts-headers: build the module against LTS Arch kernel [requires at least one set of kernel headers]')
install=e1000e-dkms.install
url='http://sourceforge.net/projects/e1000/'
source=("http://downloads.sourceforge.net/project/e1000/${_modname}%20stable/${pkgver}/${_modname}-${pkgver}.tar.gz"
        'dkms.conf.in')
sha256sums=('4441515302f901e32f29b9b4702239f176d3c02c3b9a697009f93012205e0de1'
            'ebf49307a6773034c551755238221b36b0bd88990f897bf80716ec8e0c95b029')

package() {
  cd ${srcdir}/${_modname}-${pkgver}
  install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  for i in "${srcdir}/${_modname}-${pkgver}/src/"*; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  done
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
