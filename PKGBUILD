# Maintainer: Nicholas Wang <me at nicho1as dot wang>

_pkgbase=goodix-param
pkgname=${_pkgbase}-dkms
pkgver=6.7.3
pkgrel=1
pkgdesc="Patched Goodix touchscreen with parameters"
url="https://github.com/nicholascw/aur-goodix-param-dkms"
arch=('any')
license=('GPL2')
depends=('dkms')
source=(
  "goodix.c"
  "goodix.h"
  "goodix_fwupload.c"
  "dkms.conf"
  "Makefile"
  "goodixparam.conf"
)

md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

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
  install -Dm644 goodixparam.conf "${pkgdir}/etc/modprobe.d/goodixparam.conf"
}

