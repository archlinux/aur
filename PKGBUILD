# Maintainer: Shiina Rikka <rikka@rikka.im>
# Contributor: Eumeryx <eumeryx@foxmail.com>

_pkgbase=yt6801
pkgname=yt6801-dkms
pkgver=1.0.30
pkgrel=5
pkgdesc="Kernel module for Motorcomm YT6801 ethernet controller (DKMS)"
arch=('x86_64')
url="https://www.motor-comm.com/product/ethernet-control-chip"
license=('GPL-2.0-or-later')
depends=('dkms')
source=('https://www.motor-comm.com/Public/Uploads/uploadfile/files/20250430/yt6801-linux-driver-1.0.30.zip'
        'tuxedo.patch'
        'drop-flags.patch')
sha256sums=('3dd7173a935da10fb9dfa537fd2bf4d6d3ae90c1d12e8091054667fb911bd6c4'
            '75bfbca4683c2084d8032800a506f2c7c68679a04c196d81755cea91412a3a5a'
            '814c6a121b392f512ec4c8898dd9f6c50ae3ff9d946bc1d115135fa6f5c6a897')

prepare() {
  cd ${srcdir}
  patch -p1 < tuxedo.patch
  patch -p1 < drop-flags.patch
}

package() {
  mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
  
  install -Dm644 ${srcdir}/src/*.c ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/*.h ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/Kbuild ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 ${srcdir}/src/motorcomm ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/
}
