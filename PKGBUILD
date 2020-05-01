# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: JSH <jsh6789(at)gmail(dot)com>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>

_pkgbase=r8101
pkgname=r8101-dkms
pkgver=1.035.02
pkgrel=1
pkgdesc="RTL810xE Fast Ethernet Driver (DKMS) (MANUAL DOWNLOAD)"
arch=('x86_64')
url="https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100m-fast-ethernet-pci-express-software"
license=('GPL2')
depends=('dkms')
optdepends=('ethtool: device configuration')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")

# Modify this array so that it points to the manually downloaded file
# The current setting is NOT a valid URL
source=("${url}/${_pkgbase}-${pkgver}.tar.bz2"
        'dkms.conf')
sha512sums=('779522c591a8b85c851faefaa825fdfbc709442fc8ea5fc7495a7789b1019972cd707cd7bd19c5149d76e91e7a0c30f9fbb576fa3cf5483b524cd3879beca541'
            'ab9d83c05c2c0788d253235c29bbd6f4134b14f36294acb80b35105795872d5e786bcb7ec1e579b6e4d4796ae311f00d851c5b3ed900ab8c525d65203811c8f6')

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
