# Maintainer: Patrick Brennan <cGF0cmljay5icmVubmFuQGJzZGZpcnN0LmNvbQ==>

pkgname=edimax_ac1750_8814au-dkms
_pkgbase=${pkgname%-*}
_reponame=rtl8814au_EW7833UAC
pkgver=4.3.21_17997.20160531-p4.11
pkgrel=1
pkgdesc="Kernel module for the Edimax AC1750 USB3 802.11ac adapter."
url="https://github.com/bsdfirst/rtl8814au_EW7833UAC"
license=("GPL")

arch=('armv7h' 'i686' 'x86_64')
makedepends=('git')
depends=('dkms')

source=("git+https://github.com/bsdfirst/${_reponame}.git#branch=v${pkgver}" 'dkms.conf')
sha256sums=('SKIP'
            'be3fe911a32f3235c87653cb2652c3fc14d044e5c869ace46bac1c25750b001b')
install="${pkgname}.install"

prepare() {
  sed -e "s/@PKGNAME@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${srcdir}/dkms.conf"
}

package() {
  install -D "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  cp -r "${srcdir}/${_reponame}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
