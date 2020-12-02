# Maintainer: jomp16 <root at rwx dot ovh>

_pkgbase=qc71_laptop
pkgname=qc71-laptop-dkms-git
pkgver=r39.4d7ea4c
pkgrel=1
pkgdesc="This a Linux kernel platform driver for Intel Whitebook LAPQC71X systems"
arch=('i686' 'x86_64')
url="https://github.com/pobrn/qc71_laptop"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("$_pkgbase::git+https://github.com/pobrn/qc71_laptop.git"
        'dkms.conf')
sha256sums=('SKIP'
            '9c80dd849db0aa91cd67d6016c2df5bb870c090ab3f422fb20b84d0627336255')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
