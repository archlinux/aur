# Maintainer: Shiina Rikka <rikka@rikka.im>

_pkgbase=yt6801
pkgname=yt6801-dkms
pkgver=1.0.31
pkgrel=2
pkgdesc="Kernel module for Motorcomm YT6801 ethernet controller (DKMS)"
arch=('x86_64')
url="https://www.motor-comm.com/product/ethernet-control-chip"
license=('GPL-2.0-or-later')
depends=('dkms')
source=(${_pkgbase}-${pkgver}.zip::'https://www.motor-comm.com/Cn/Skippower/downloadFile.html?id=1817'
        'patch.diff')
sha256sums=('9ea62182bd520483df5fd3ec320262cbdddcc763f3128ae37abd26905a97e14c'
            '6cdb77774c483b640c8f0499fd54a79e773cd3f96a426cd99eec385972d9d5bb')

prepare() {
  cd ${srcdir}
  mkdir src
  tar -zxf ${_pkgbase}-${pkgver}.tar.gz -C src
  patch -p1 < patch.diff
}

package() {
  mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
  
  install -Dm644 ${srcdir}/src/*.c ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/*.h ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/Makefile ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/motorcomm ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
}
