# Maintainer: steelt <steeltitanium1 at gmail dot com>

_pkgbase=msi-ec
pkgname=msi-ec-dkms-git
pkgver=r320.be6f715
pkgrel=1
pkgdesc="Driver for MSI laptop EC (DKMS)"
arch=('x86_64')
license=('GPL2')
url="https://github.com/BeardOverflow/msi-ec"
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/BeardOverflow/msi-ec.git"
  "dkms.conf")
sha256sums=('SKIP'
            'f2846d9e9b3734dbdeb41dafde34ec5b5fd2353732cb30cf2606ba89083e1875')

pkgver() {
    cd ${_pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  sed -e "s/@VERSION@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf 

  cd "${_pkgbase}"

  install -Dm644 -t "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" \
    Makefile \
    msi-ec.c \
    ec_memory_configuration.h
}
