# Maintainer: 9M2PJU <9m2pju at hamradio dot my>

pkgname=rtl8852cu-dkms-morrownr-git
_pkgbase=rtl8852cu
pkgver=20240701
pkgrel=2
pkgdesc="Realtek RTL8852CU DKMS driver from morrownr, maintained by 9M2PJU"
arch=('x86_64')
url="https://github.com/9M2PJU/rtl8852cu-20240510-aur"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=('rtl8852cu')
conflicts=('rtl8852cu')
source=("git+${url}.git")
md5sums=('SKIP')
install=rtl8852cu.install

pkgver() {
  date +%Y%m%d
}

package() {
  cd "${srcdir}/${_pkgbase}-20240510-aur"
  install -Dm755 install-driver.sh "${pkgdir}/usr/bin/install-rtl8852cu-driver"
  install -Dm755 uninstall-driver.sh "${pkgdir}/usr/bin/uninstall-rtl8852cu-driver"
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Copy all source files for dkms
  cp -a . "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

  # Fix dkms.conf if necessary
  sed -i "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}
