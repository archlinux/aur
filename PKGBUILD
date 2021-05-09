# Maintainer: WhiredPlanck

pkgname=astap-bin
_pkgname=astap
pkgver=0.9.532
pkgrel=1
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer"
arch=('i686' 'x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
#depends=('desktop-file-utils' 'libxrender' 'shared-mime-info' 'libxext' 'gtk2')
source_i686=("${_pkgname}_i386.deb::https://sourceforge.net/projects/astap-program/files/linux_installer/astap_i386.deb/download")
source_x86_64=("${_pkgname}_amd64.deb::https://sourceforge.net/projects/astap-program/files/linux_installer/astap_amd64.deb/download")
sha256sums_i686=('6fe9589c354d4d0b61d9e6daccfc038794dbe310df93b94644fb3b0175a4074b')
sha256sums_x86_64=('a12a4024e2789fe492361b447a667a6375f031633e44ab6c270be90b3d88c709')

build() {
  if [[ "$CARCH" == "i686" ]]; then
    ar x "${_pkgname}_i386.deb"
  else
    ar x "${_pkgname}_amd64.deb"
  fi
}

package() {
  bsdtar --acls --xattrs -xpf data.tar.xz -C "${pkgdir}"
  find "${pkgdir}" -type d -exec chmod 755 {} +
  cd "${pkgdir}"/opt/astap
  chmod 666 deep_sky.csv
  chmod 666 variable_stars.csv
  chmod 644 "acknowledgement of databases.txt"
  chmod 644 copyright.txt
  # chmod 755 usr/share/
  # chmod 755 usr/share/applications/
}
