# Maintainer: krnlsoft <krnlsoft 4t hotmail d0t it>

_pkgbase=blksnap
_pkgname=veeam${_pkgbase}
pkgname=${_pkgname}-dkms
pkgver=6.2.0.101
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
sha256sums=('a38f8ea118a8472916b274aaac26eb279521b0c982971b7e76b2aebda4ea8a16'
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
