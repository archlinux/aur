# Maintainer: Shiina Rikka <rikka@rikka.im>

_pkgbase=yt6801
pkgname=yt6801-dkms
pkgver=1.0.30
pkgrel=2
pkgdesc="Kernel module for Motorcomm YT6801 ethernet controller (DKMS)"
arch=('x86_64')
url="https://www.motor-comm.com/product/ethernet-control-chip"
license=('GPL-2.0-or-later')
depends=('dkms')
source=('https://www.motor-comm.com/Public/Uploads/uploadfile/files/20250430/yt6801-linux-driver-1.0.30.zip'
        '6.15-fix.patch'
        'drop-flags.patch')
sha256sums=('3dd7173a935da10fb9dfa537fd2bf4d6d3ae90c1d12e8091054667fb911bd6c4'
            '3a3ba74d3a22ac8e1c1cf6c8b28fe4df1c84ad589dd1c5b537fc84a7e1902f93'
            '335ab98a645a6e55428a5110206cbee98eb2030af8b578022865a1cdac4658cc')

prepare() {
  cd ${srcdir}
  patch -p1 < 6.15-fix.patch
  patch -p1 < drop-flags.patch
}

package() {
  mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
  
  install -Dm644 ${srcdir}/src/*.c ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/*.h ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/Makefile ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/motorcomm ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
}
