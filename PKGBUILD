# Maintainer: didi2002 <didi2002 at mailbox . org>
_pkgbase=r8126
pkgname=r8126-dkms
pkgver=10.015.00
pkgrel=2
pkgdesc="Kernel module for Realtek RTL8126"
arch=('x86_64')
url='https://www.realtek.com/Download/List?cate_id=584'
license=('GPL-2.0-or-later')
depends=('dkms' 'linux-firmware')
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
conflicts=("${_pkgbase}")
source=("https://github.com/openwrt/rtl8126/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.bz2"
        "dkms.conf")
sha256sums=('fac513aa925264a95b053e7532fcda56022d29db288f6625fafee2759a8a6124'
            'e14ab919e5d71f530d906d06a9b2c35985833b12d9854825877d0151347399df')
package() {
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i dkms.conf

  install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 dkms.conf "${_pkgbase}-${pkgver}"/src/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}
