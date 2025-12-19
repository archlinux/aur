# Maintainer: Shiina Rikka <rikka@rikka.im>

_pkgbase=yt6801
pkgname=yt6801-dkms
pkgver=1.0.31
pkgrel=1
pkgdesc="Kernel module for Motorcomm YT6801 ethernet controller (DKMS)"
arch=('x86_64')
url="https://www.motor-comm.com/product/ethernet-control-chip"
license=('GPL-2.0-or-later')
depends=('dkms')
source=(${_pkgbase}-${pkgver}.zip::'https://www.motor-comm.com/Cn/Skippower/downloadFile.html?id=1817'
        'fix.patch'
        'drop-flags.patch')
sha256sums=('9ea62182bd520483df5fd3ec320262cbdddcc763f3128ae37abd26905a97e14c'
            '3e850f2d35fd3da6d10035b5ea04e995a0d7962b1c02599b42f1f7a296822e78'
            '814c6a121b392f512ec4c8898dd9f6c50ae3ff9d946bc1d115135fa6f5c6a897')

prepare() {
  cd ${srcdir}
  mkdir src
  tar -zxf ${_pkgbase}-${pkgver}.tar.gz -C src
  patch -p1 < drop-flags.patch
  patch -p1 < fix.patch
}

package() {
  mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
  
  install -Dm644 ${srcdir}/src/*.c ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/*.h ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/Makefile ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/motorcomm ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
}
