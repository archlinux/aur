# Maintainer: JSH <jsh6789(at)gmail(dot)com>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>

_pkgbase=r8101
pkgname=r8101-dkms
pkgver=1.030.02
pkgrel=1
pkgdesc="r8101 realtek lan drivers (DKMS)"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"
license=('GPL2')
depends=('dkms>=2.2.0.3+git151023-5')
optdepends=('ethtool: device configuration')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")

source=("http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/cn/nic/0005-${_pkgbase}-${pkgver}.tar.bz2"
        'dkms.conf')

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
sha256sums=('970bb30153bcaed220ec5ff6e8a537294beb7cd31fb4f6b0b69d91e720ee9203'
            '2846e89fe3fd68c64c71a0f1150873a061571acc63e65cca6d825df7985ad7b5')
