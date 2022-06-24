# Maintainer: kylon

_pkgbase=goodix-gpdwin3
pkgname=${_pkgbase}-dkms
pkgver=1.1
pkgrel=3
pkgdesc="Goodix touchscreen driver hack for GPD WIN3"
arch=('any')
license=('GPL2')
depends=('dkms')
source=(
  "goodix.c"
  "goodix.h"
  "goodix_fwupload.c"
  "dkms.conf"
  "Makefile"
  "goodixgpdw3.conf"
)
md5sums=('6ef1b9c306d7996e7bfdb9cc50677f81'
	 '7543431323fd4a1efb2d381b69886ef9'
	 '616b595d278b52a265156c2fa68a740c'
         'f514c2a1d6de0f50ea5ebc112447ff7d'
         'aa21936d9b3341c25761f7c4a827f39d'
         '1505740dffca34d8119f3798a0624ebc')

package() {
  cd "$srcdir"
  local install_dir="${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${install_dir}"/dkms.conf

  install -Dm644 goodix.c "${install_dir}/goodix.c"
  install -Dm644 goodix.h "${install_dir}/goodix.h"
  install -Dm644 goodix_fwupload.c "${install_dir}/goodix_fwupload.c"
  install -Dm644 Makefile "${install_dir}/Makefile"
  install -Dm644 goodixgpdw3.conf "${pkgdir}/etc/modprobe.d/goodixgpdw3.conf"
}

