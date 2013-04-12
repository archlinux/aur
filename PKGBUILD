# Maintainer: Alexej Magura <agm2819*gmail*com>
# Contributor: libernux <dutchman55l@gmx.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
pkgname=wmcore
pkgver=0.0.2
pkgrel=7
pkgdesc="A windowmaker dockapp which shows the usage of each core in the system"
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/362"
license=('GPL')
groups=('x11')
depends=('libxext' 'libxpm')
source=("http://dockapps.windowmaker.org/download.php/id/917/${pkgname}-${pkgver}.tar.gz")
md5sums=('26899aba55f84e649178ab8ab18f331e')
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make clean
  make 
}

package() {
  # get to the source :P
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # create the sub-dirs that the files-to-be-installed will be placed in.  
  
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

  # install the binary with 755 permissions 
  
  install -m 755 -T "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  # install 'README', 'CHANGES', and 'COPYING' with 644 permissions.  
  #	but only do this IF those files are present.  
  
  if [[ -f "README" ]]; then
      install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README";
  fi
  if [[ -f "CHANGES" ]]; then
      install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "CHANGES";
  fi
  if [[ -f "COPYING" ]]; then
      install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "COPYING";
  fi
}

