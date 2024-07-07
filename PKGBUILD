# Maintainer: krnlsoft

_pkgbase=veeamblksnap
pkgname=${_pkgbase}-dkms-git
pkgver=6.2
pkgrel=1
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="https://repository.veeam.com/backup/linux/agent"
license=('GPLv2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
install=${_pkgbase}.install
source=("git+https://github.com/veeam/blksnap.git#branch=VAL-6.2"
        'dkms.conf')
sha256sums=('SKIP'
  '8f230291a36d2de76bf8a8afb59f1497ff5f2c27a8b226c5306415514365928c')

prepare() {
  mv "${srcdir}/blksnap" "${srcdir}/${_pkgbase}"
}

build() {
  msg "build..."
}

package() {
  # Install
  msg2 "pkgdir: "${pkgdir}
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${srcdir}/${_pkgbase}/module/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
