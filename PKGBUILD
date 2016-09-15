# Maintainer: JSH <jsh6789(at)gmail(dot)com>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>

_pkgbase=r8101
pkgname=r8101-dkms
pkgver=1.029.00
pkgrel=2
pkgdesc="r8101 realtek lan drivers (DKMS)"
arch=('i686' 'x86_64')
url="http://realtek.com.tw/"
license=('GPL2')
depends=('dkms>=2.2.0.3+git151023-5')
optdepends=('ethtool: device configuration')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")

source=("http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/cn/nic/0004-${_pkgbase}-${pkgver}.tar.bz2"
        'linux-4.7.patch'
        'dkms.conf')

prepare() {
	cd "r8101-$pkgver"
	
	patch -p1 -i ../linux-4.7.patch
}

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
sha256sums=('c3dfb8d19edfa5a84a703d4a85dff528318d756f0a891bf6c646987dd0bde357'
            '02f79515b0b1c2b7517b7f74b117679816fc6a321be768f91ee93121ae5f3dd2'
            '2846e89fe3fd68c64c71a0f1150873a061571acc63e65cca6d825df7985ad7b5')
