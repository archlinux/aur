# Maintainer: Bernd Amend <bernd.amend(at)gmail(dot)com>
# Contributor: Alex Avance
# Contributor: Shen-Ta Hsieh <ibmibmibm(at)gmail(dot)com>

_pkgname=r8125
pkgname=${_pkgname}-dkms
pkgver=9.004.01
pkgrel=4
url="https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software"
pkgdesc="Kernel module for RTL8125"
license=('GPL2')
arch=('x86_64')
depends=('dkms')
conflicts=("${_pkgname}")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
source=("https://github.com/ibmibmibm/r8125/archive/master.tar.gz" 'dkms.conf')
sha256sums=('c25ec4ea817bd00108b023afbc19383ea177c042e6ee52c8c386c17615bb9b98'
            '8a10787ee95ef4279408dc9711c23863926a8e6b9081161b47f56b78b0c54a9f')

package() {
  dir_name="${_pkgname}-${pkgver}"
  install -d "${pkgdir}"/usr/src/${dir_name}/
  install -Dm644 dkms.conf "${_pkgname}-master"/src/* "${pkgdir}/usr/src/${dir_name}/"

  sed -e "s/@_PKGNAME@/${_pkgname}/g" \
      -e "s/@PKGVER@/${pkgver}/g" \
      -i "${pkgdir}/usr/src/${dir_name}/dkms.conf"
}
