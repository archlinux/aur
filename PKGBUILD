# Maintainer: JSH <jsh6789(at)gmail(dot)com>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>

_pkgbase=r8101
pkgname=r8101-dkms
pkgver=1.027.00
pkgrel=1
pkgdesc="r8101 realtek lan drivers (DKMS)"
arch=('i686' 'x86_64')
url="http://realtek.com.tw/"
license=('GPL2')
depends=('dkms')
optdepends=('ethtool: device configuration')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
install=${pkgname}.install

# To retrieve the source file, you must first visit the following URL, click
# the link to the right of the LINUX driver, and finally place the file in the
# directory containing this PKGBUILD. Make sure the version matches pkgver.
# http://www.realtek.com.tw/Downloads/downloadsView.aspx?Langid=1&PNid=14&PFid=7&Level=5&Conn=4&DownTypeID=3&GetDown=false

source=('dkms.conf')

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
sha256sums=('2846e89fe3fd68c64c71a0f1150873a061571acc63e65cca6d825df7985ad7b5')
