# Maintainer: ureeves <ureeves@ureeves.com>
_pkgbase=malign
pkgname=${_pkgbase}-dkms
pkgver=0.1.0
pkgrel=1
pkgdesc="Kernel module providing aligned memory mappings"
arch=(any)
url="https://github.com/ureeves/${_pkgbase}"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('linux-headers')
source=("https://github.com/ureeves/${_pkgbase}/archive/refs/tags/v0.1.0.tar.gz"
        "${pkgname}.conf"
        "dkms.conf")
sha256sums=('2c9ed427fabbea157ebf6e125c19c6dd615c2fa6e13195fc9ae7dfd6a724cb24'
            '39e6a7ee90462a23228b829cd7138444db5b88b35cbe23699f35882f4c4c29fb'
            '9da212125ec90af239371690cdc904d6dff6831cac1d09cc214e717d527a6325')

prepare() {
  cd ${_pkgbase}-${pkgver}
}

package() {
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  cp -r "${_pkgbase}-${pkgver}"/src/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

  install -Dm644 ${pkgname}.conf "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
}
