# Maintainer: tdolega <tymoteusz.dolega at gmail dot com>

_pkgbase=hid-tmff2
pkgname="${_pkgbase}-dkms"
pkgver=0.8
pkgrel=1
pkgdesc="Linux kernel module for Thrustmaster T300RS (DKMS)"
arch=('x86_64')
url="https://github.com/Kimplul/${_pkgbase}"
license=('GPL-3.0')
depends=('dkms')
conflicts=("${_pkgbase}")
# install=${pkgname}.install
source=("git+${url}")
#md5sums=(use 'updpkgsums')
md5sums=(SKIP)

prepare() {
  cd ${_pkgbase}
  git submodule update --init --recursive
}

package() {
  install -Dm644 ${_pkgbase}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}