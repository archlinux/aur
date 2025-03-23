# Maintainer: krnlsoft <krnlsoft 4t hotmail d0t it>

_pkgbase=blksnap
_pkgname=veeam${_pkgbase}
pkgname=${_pkgname}-dkms
pkgver=6.3.1.1016
pkgrel=1
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="https://repository.veeam.com/backup/linux/agent"
license=('GPL')
depends=('dkms')
conflicts=("${_pkgbase}")
install=${_pkgname}.install
source=("${url}/rpm/el/9/x86_64/blksnap-${pkgver}-1.noarch.rpm"
        'dkms.conf')
sha256sums=('9763e46d56fd5058714cf5a56881c5774e61823e1579dff2b6d80743fbc27194'
  '8f230291a36d2de76bf8a8afb59f1497ff5f2c27a8b226c5306415514365928c')

package() {
  mkdir -p "${pkgdir}"/usr/src/${_pkgname}-${pkgver}

  # Copy sources (including Makefile)
  cp -r ${srcdir}/usr/src/${_pkgbase}-${pkgver}/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
}
