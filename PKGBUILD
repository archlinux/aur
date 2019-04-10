# Maintainer: Code Imp  <code_imp@bk.ru>

_pkgbase=veeamsnap
pkgname=veeamsnap
pkgver=3.0.1.1046
pkgrel=1
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="https://www.github.com/veeam/veeamsnap"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
install=${pkgname}.install
#source=('veeamsnap.tar.gz'
source=( "${url}/archive/experimental.zip"
        'dkms.conf')
md5sums=('b13a6056bbf9213fdde270a0a6a283a4'
         '23381bcf3c992e0b6467be681bbc751a')

package() {
  # Install
  msg2 "pkgdir: "${pkgdir}
  #msg2 "Starting make install..."
  #make DESTDIR="${pkgdir}" install

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  
  # Copy sources (including Makefile)
  cp -r ${_pkgbase}-experimental/source/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}

