# Maintainer: JSH <jsh6789(at)gmail(dot)com>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>

_pkgbase=r8101
pkgname=r8101-dkms
pkgver=1.035.01
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
sha512sums=('82a194498854885ff705070cf99922e0afd38074fe8cb17052a35ad835329d0cdda20a8fb87031cd59b2a3a9a6a44b8e3ed1ee5f8890f58229426051b460d727'
            'ab9d83c05c2c0788d253235c29bbd6f4134b14f36294acb80b35105795872d5e786bcb7ec1e579b6e4d4796ae311f00d851c5b3ed900ab8c525d65203811c8f6')

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
