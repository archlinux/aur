# Maintainer: Tin Lai  <soraxas at tinyiu.com>
pkgname=acpi_ec-dkms-git
_pkgbase=acpi_ec
pkgver=r28.75102ce
pkgrel=1
pkgdesc="MControlCenter is a Free and Open Source GNU/Linux application that allows you to change the settings of MSI laptops"
arch=('x86_64')
url="Kernel module to access directly to the ACPI EC."
license=('GPL')
depends=('dkms' 'mokutil')
conflicts=("${_pkgbase}")
makedepends=()
source=("git+https://github.com/musikid/acpi_ec")
md5sums=('SKIP')
provides=('acpi_ec' 'ec_sys')
conflict=()

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Copy dkms.conf
  install -Dm644 ${_pkgbase}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  # Set name and version
  sed -e "s/\$VERSION/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
