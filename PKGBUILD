# Maintainer: Marcel Krüger <marcel@2krueger.de>

_pkgbase=intel_nuc_led
pkgname=${_pkgbase}-dkms-git
pkgver=r2.65e93ef
pkgrel=1
pkgdesc="Intel NUC7i[x]BN and NUC6CAY LED Control for Linux (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/milesp20/intel_nuc_led"
license=('GPL3')
depends=('dkms')
makedepends=('git')
#conflicts=("${_pkgbase}")
#install=${pkgname}.install
source=("git+https://github.com/milesp20/intel_nuc_led.git"
        'dkms.conf')
md5sums=('SKIP'
         '80494ee6de55e6ac0e4727fab41da5d2')

pkgver() {
  cd "$intel_nuc_led"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  :
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
