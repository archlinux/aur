# Maintainer: haagch <haagch@studi.informatik.uni-stuttgart.de>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: 6xx
# Contributor: csslayer

pkgname=ekopath-bin
_real_name=ekopath
pkgver=20160212
pkgrel=1
pkgdesc="A high-performance Intel 64 / AMD64 compiler for C99, C++ 2003, Fortran 90/95 and partial 2003"
url="http://pathscale.com/ekopath-compiler-suite"
arch=('x86_64')
license=('GPL')
options=(!strip)
source=(checkver.py)

pkgver() {
  date +%Y%m%d
}

build() { 
export DLURL=$(${srcdir}/checkver.py)
export DLFILENAME=${DLURL##*/}

  msg "Downloading $DLFILENAME"

  if [ ! -f ${DLFILENAME} ]; then
    wget ${DLURL}
  fi
  chmod +x ${DLFILENAME}
}

package() {
  "$srcdir/$DLFILENAME" --mode unattended --prefix "${pkgdir}"/usr
  
  rm -f "${pkgdir}"/usr/uninstall
  rm -f "${pkgdir}"/usr/bin/{pathdb,funclookup}
  chmod +x "${pkgdir}"/usr/bin/pathcc
  rm -f "${pkgdir}"/usr/bin/pathcc.bak
  
}
md5sums=('dee1655664ef4a5fe3d05b0b5aff00ac')
