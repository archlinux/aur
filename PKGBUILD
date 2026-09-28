_pkgbase=rtl8852-eco4
pkgname=rtl8852-eco4-dkms
pkgver=7.2.7
pkgrel=1
pkgdesc="Bluetooth driver for RTL8852 ECO Version 4 (DKMS)"
arch=('x86_64')
url="https://github.com/q234rty/rtl8852be-eco4-dkms"
license=('GPL-2.0-only' 'LicenseRef-Lenovo')
depends=('dkms')
makedepends=('git' 'innoextract')
source=("${_pkgbase}::git+https://github.com/q234rty/rtl8852be-eco4-dkms.git#tag=$pkgver"
        https://download.lenovo.com/consumer/mobiles/50s5010fpm3t3cj0.exe)
sha256sums=('2c9c0f75f5d9fcf06157f5ece97692c94a4cf7ddab850a478f3c86083ec72d6c'
            '1cbafaf1e2b224271ad05aacd0229929a2aadfb996a5e3ee6e1649d8a24a4c1e')

prepare() {
  innoextract 50s5010fpm3t3cj0.exe
}
package() {
  install -dm755 "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  install -dm755 "${pkgdir}"/usr/lib/firmware/rtl_bt
  install -m644 'code$GetExtractPath$'/rtl8852bd_mp_chip_new.dat "${pkgdir}"/usr/lib/firmware/rtl_bt/rtl8852bu_fw.bin
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
