# maintainer: libele <libele@disroot.org>

pkgname=libf2c
pkgver=34.3.4.6.32
_rpmver=34-3.4.6-32.el7
_386ver=34-3.4.6-4.1
pkgrel=2
pkgdesc="A library which is needed to run Fortran 77 dynamically linked programs built by g77 3.4.x (CentOS 7)."
arch=('i386' 'x86_64')
url="https://centos.pkgs.org/7/centos-x86_64/compat-libf2c-34-3.4.6-32.el7.x86_64.rpm.html"
license=("LGPL" "GPL2")
options=(!strip)
makedepends=('rpmextract')
source_i386=("https://linuxsoft.cern.ch/cern/slc5X/i386/yum/updates/compat-${pkgname}-${_386ver}.i386.rpm")
source_x86_64=("http://mirror.centos.org/centos/7/os/x86_64/Packages/compat-${pkgname}-${_rpmver}.x86_64.rpm")
md5sums_i386=('78c4d30176d0e17aece5015cb47eb80f')
md5sums_x86_64=('98ff125a18fd917949bbe556b05f72a7')
noextract=("compat-${pkgname}-*.rpm")

pkgver() {
  if [ "${CARCH}" == "i386" ]; then
    printf "34.3.4.6.4.1"
  else
    printf "${pkgver}"
  fi
}

prepare() {
  cd "${srcdir}"
  if [ "${CARCH}" == "i386" ]; then
    _rpmver="${_386ver}"
  fi
  rpmextract.sh "compat-${pkgname}-${_rpmver}.${CARCH}.rpm"
}

package() {
  cd "${srcdir}"
  mv usr "${pkgdir}"/usr
  cd "${pkgdir}"/usr
  mv lib64 lib
  cd share

  mv doc/compat-"${pkgname}"-34-3.4.6 doc/"${pkgname}"
}
