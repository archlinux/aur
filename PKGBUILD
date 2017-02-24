# Maintainer: Tobias Göbel <kubax1983(at)gmail(dot)com>

_pkgbase=ncpfs
pkgname=ncpfs-module-dkms
pkgver=1
pkgrel=1
pkgdesc="The NCPFS kernel module (DKMS)"
arch=('i686' 'x86_64')
url="https://www.kernel.org/"
license=('GPL2')
depends=('dkms')
install=${pkgname}.install
source=("ncpfs-module.tar.gz"
        'dkms.conf')
sha512sums=('c37b9d7609b8126e25fabd5d631e8cf09c15304536d019f8916915a3b1c147da3c9f065934f34fb9ee40f59dfc622d9766dbea0b97763ccd2bb5ab73b832b878'
            'd0aa2080c891ed261d9e2ece050336c4ee9fda1e016bf689505f445a612530c1410bd9706824e665265bb95f2b9b3e77b10bc393dff1b4e7637ff6123af0bc56')
package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
