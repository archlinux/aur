# Maintainer: JSH <jsh6789(at)gmail(dot)com>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>

_pkgbase=r8101
pkgname=r8101-dkms
pkgver=1.033.00
pkgrel=4
pkgdesc="RTL810xE Fast Ethernet Driver (DKMS) (MANUAL DOWNLOAD)"
arch=('i686' 'x86_64')
url="https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100m-fast-ethernet-pci-express-software"
license=('GPL2')
depends=('dkms>=2.2.0.3+git151023-5')
optdepends=('ethtool: device configuration')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")

# Modify this array so that it points to the manually downloaded file
# The current setting is NOT a valid URL
source=("${url}/0010-${_pkgbase}-${pkgver}.tar.bz2"
        'dkms.conf')

#prepare() {
#  cd "r8101-$pkgver"
#  
#  patch -p1 -i "../linux-4.15.patch"
#}

package() {

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}-${pkgver}/src ${_pkgbase}-${pkgver}/Makefile \
        "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
sha256sums=('587146b9fd651ec3df5d8b99ee39a6587784627d8d6245185e5d188bc755560c'
            '2846e89fe3fd68c64c71a0f1150873a061571acc63e65cca6d825df7985ad7b5')
