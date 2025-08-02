# Maintainer: Alvin Null <supdrewin at gmail dot com>

_pkgbase=ft9201-fingerprint-driver
pkgname=${_pkgbase}-dkms-git
pkgver=r13.41c7aa6
pkgrel=1
pkgdesc="The Focal-systems.Corp FT9201Fingerprint.̚ kernel modules (DKMS)"
arch=('x86_64')
url="https://github.com/banianitc/ft9201-fingerprint-driver"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
install=${_pkgbase}.install
source=("git+$url.git"
        'dkms.conf')
b2sums=('SKIP'
        '089e3aa7ee055e839329408c7d8cecc7b5f754940cde74a9540de39d5e75dac646b94a34012b433d388eaae7876cbed2831c7f4d238151904e407c04b863a33d')

pkgver() {
	cd "${srcdir}"/${_pkgbase}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
