# Maintainer: Bernd Amend <bernd.amend(at)gmail(dot)com>
# Contributor: Shen-Ta Hsieh <ibmibmibm(at)gmail(dot)com>

_pkgname=r8125
pkgname=${_pkgname}-dkms
pkgver=9.004.01
pkgrel=3
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
            '425f714f0cc5373a2f1808c1cf6cbfd605a1774ce9a789620fe86a026e319fee')

package() {
  dir_name="${_pkgname}-${pkgver}"
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${dir_name}/dkms.conf"

  sed -e "s/@_PKGNAME@/${_pkgname}/g" \
      -e "s/@PKGVER@/${pkgver}/g" \
      -i "${pkgdir}/usr/src/${dir_name}/dkms.conf"

  cp -r "${_pkgname}-master"/* "${pkgdir}/usr/src/${dir_name}/"
}
