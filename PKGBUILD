# Mantainer: Pedro Gabriel <pedrogabriel@gmail.com>
# Conbributor: Felix Golatofski <contact@xdfr.de>
# Contributor: JSH <jsh6789(at)gmail(dot)com>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>

_pkgbase=r8101
pkgname=r8101-dkms
pkgver=1.035.03
pkgrel=2
pkgdesc="RTL810xE Fast Ethernet Driver (DKMS)"
arch=('x86_64')
url="https://fichiers.touslesdrivers.com/64992/"
license=('GPL2')
depends=('dkms' 'pahole')
optdepends=('ethtool: device configuration')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")

# Modify this array so that it points to the manually downloaded file
# The current setting is NOT a valid URL
source=("${url}/${_pkgbase}-${pkgver}.tar.bz2"
        'dkms.conf')
sha512sums=('5dcf16b86a6cf8c30443a222103b2ef707cb6c7eb76509854f3cf205fd6713cfae501494c2d1cd42416b3e395e0e498d13da50f40de3864a2a777a8726697581'
            '7b70e04b83f7593e16c1fa2aa404b55a40bac40cc97a085e5713dc43b04b3b91f17da8b51e86000ce57fc1c7845ae1d375929929090d9ad050cf6bea3e18b4d3')

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
