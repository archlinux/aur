# Maintainer: Francois Menning <f.menning@protonmail.com>

_pkgname=cleanerml
pkgname=cleanerml-git
pkgver=r735.2b8c706
pkgrel=1
pkgdesc='System cleaners written in CleanerML used by BleachBit.'
url='https://github.com/az0/cleanerml'
license=('GPL-3.0-or-later')
source=('git+https://github.com/az0/cleanerml.git')
sha256sums=('SKIP')
arch=('any')
depends=('bleachbit')
makedepends=('git')
conflicts=('cleanerml')
provides=('cleanerml')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/share/bleachbit/cleaners"

  # WARNING: Files in "pending" are waiting for someone to verify they are safe
  # You can uncomment the following lines at your own risk
  #cp -r ${srcdir}/${_pkgname}/pending/*.xml "${pkgdir}/usr/share/bleachbit/cleaners"
  #rm -rf "${pkgdir}/usr/share/bleachbit/cleaners/waterfox.xml"

  # Is considered to be stable
  cp -r ${srcdir}/${_pkgname}/release/*.xml "${pkgdir}/usr/share/bleachbit/cleaners"
  rm -rf "${pkgdir}/usr/share/bleachbit/cleaners/wine.xml"
}
