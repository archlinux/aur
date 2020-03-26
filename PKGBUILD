# Maintainer: nicman23
_pkgbase=hid-nintendo
pkgname=${_pkgbase}-dkms
pkgver=1.0
pkgrel=1
pkgdesc="hid-nintendo Driver (DKMS)"
arch=('any')
url="https://github.com/nicman23/dkms-hid-nintendo"
license=('GPLv2')
depends=('dkms' 'linux-headers' 'bc')
provides=('hid-nintendo')
source=("git+${url}" "dkms.conf")
md5sums=("SKIP"
         '7352b2bc2587a09abd876c1f2c216f43')

package() {
  mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  chmod 755 "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  cp -r dkms-hid-nintendo/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
