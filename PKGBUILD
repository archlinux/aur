# Maintainer:  <clu>

pkgname=ds9-bin  
_pkgname=ds9
pkgver=8.6
pkgrel=4
pkgdesc="SAOImage DS9: Astronomical Data Visualization Application"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('x86_64')
license=('GPL-3.0-or-later')
options=(!strip)
provides=(${_pkgname})
depends=(gcc-libs fontconfig libxft libx11 icu xz zlib glibc libxext libxss freetype2 libxml2-legacy)
makedepends=('patchelf')
conflicts=(ds9)
replaces=()
backup=()
# Hooray arch!
#https://ds9.si.edu/download/archlinuxx86/ds9.archlinuxx86.8.6.tar.gz
source=(https://ds9.si.edu/download/archlinuxx86/${_pkgname}.archlinuxx86.${pkgver}.tar.gz
        ds9.desktop
        ds9.png)
md5sums=('16017e980234ab984d14f9d64e3456a8'
         'f1738e4ec665ae9afd1b65b86e6a07f1'
         '9297d5738f5f462831075c483dc785d5')






# ds9.desktop
#md5sums+=('195b619383718be1dffe94e39975f006')

package() {
  cd ${srcdir}

  install -Dm755 ds9 ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # temporary fix for arch ahead of ds9 binary...
  patchelf --replace-needed libicui18n.so.75 libicui18n.so ${pkgdir}/usr/bin/ds9
  patchelf --replace-needed libicudata.so.75 libicudata.so ${pkgdir}/usr/bin/ds9
  patchelf --replace-needed libicuuc.so.75 libicuuc.so ${pkgdir}/usr/bin/ds9
}

