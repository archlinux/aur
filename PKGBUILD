# Maintainer: didi2002 <didi2002 at mailbox . org>
_pkgbase=r8126
pkgname=r8126-dkms
pkgver=10.018.00
pkgrel=2
pkgdesc="Kernel module for Realtek RTL8126"
arch=('x86_64')
url='https://www.realtek.com/Download/List?cate_id=584'
license=('GPL-2.0-or-later')
depends=('dkms' 'linux-firmware-realtek')
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
conflicts=("${_pkgbase}")
source=("https://github.com/openwrt/rtl8126/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.bz2"
        "dkms.conf")
sha256sums=('ee3f531b65910e2443d98048d0578d404f538fa28ba428782da39f3e189a6fff'
            '360ddef7c8beb5156f272ae816bd2a9c6b0edcda0e2e9159d01208c91ae93b2c')

package() {
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i dkms.conf

  install -d "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  install -Dm644 dkms.conf "${_pkgbase}-${pkgver}/src"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}
