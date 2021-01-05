# Maintainer: Mounir Erhili <mounirerhili@gmail.com>

pkgname=rtl8821ce-dkms-lts
_pkgbase=rtl8821ce
pkgver=1.0.5.r116.g14b536f
pkgrel=1
pkgdesc="rtl8821CE driver for lts kernel with firmware"
arch=('i686' 'x86_64')
url="https://github.com/tomaspinho/rtl8821ce.git"
license=('GPL2')
depends=('dkms' 'bc' 'linux-lts-headers')
makedepends=('git' 'bc' 'linux-lts-headers')
conflicts=("${_pkgbase}")
source=("git+https://github.com/tomaspinho/rtl8821ce.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/rtl8821ce
  printf '%s.r%s.g%s' '1.0.5' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/rtl8821ce
  mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
  cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
