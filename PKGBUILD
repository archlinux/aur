# Maintainer: JSH <jsh6789(at)gmail(dot)com>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>

_pkgbase=r8101
pkgname=r8101-dkms
pkgver=1.034.02
pkgrel=1
pkgdesc="RTL810xE Fast Ethernet Driver (DKMS) (MANUAL DOWNLOAD)"
arch=('x86_64')
url="https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100m-fast-ethernet-pci-express-software"
license=('GPL2')
depends=('dkms>=2.2.0.3+git151023-5')
optdepends=('ethtool: device configuration')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")

# Modify this array so that it points to the manually downloaded file
# The current setting is NOT a valid URL
source=("${url}/${_pkgbase}-${pkgver}.tar.bz2"
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
sha256sums=('f2626f4230eb0c8bd8811929e4d3ae076f7048ff5ba9a4b1cfea5205ba95d895'
            '2846e89fe3fd68c64c71a0f1150873a061571acc63e65cca6d825df7985ad7b5')
