# Maintainer: Oystein Sture <oysstu@gmail.com>

_release='2018'
pkgname="labview-mathscript-${_release}"
pkgver=1
pkgrel=1
pkgdesc='LabVIEW MathScript is a text-based environment you can use to write functions and scripts.'
url="http://www.ni.com/en-no/shop/select/labview-mathscript-module"
arch=('x86_64')
license=("custom:LabVIEW-${_release}")
depends=('labview-2018')
makedepends=('libarchive' 'p7zip' 'tar')
options=('!strip') # Avoid time consuming operations.
PKGEXT='.pkg.tar' # Do not compress
source=("file://MathScript2018.iso")
sha256sums=('1706b414f58a00b7bcedd109529e3ba713681a9a463241257f0965a12523c90f')

prepare() {
    cd ${srcdir}
    7z -y x ${source[0]#file://}
    cd "Linux"
    tar -xzvf "lvsupport2018-mathscriptrt-18.0.0-f1.tar.gz"
    cd "rpms"
    bsdtar -xf "lvsupport2018-mathscriptrt-18.0.0-f1.x86_64.rpm"
}
            
            
package() {
  mkdir -p "${pkgdir}/opt"

  cp -rp "${srcdir}/Linux/rpms/usr/local/natinst" "${pkgdir}/opt/"
     
  mkdir -p "${pkgdir}/usr/share/licenses/LabVIEW-MathScriptRT-${_release}"
  cp "${srcdir}/Linux/LICENSE.txt" "${pkgdir}/usr/share/licenses/LabVIEW-MathScriptRT-${_release}/LICENSE.txt"
  cp "${srcdir}/Linux/PATENTS.txt" "${pkgdir}/usr/share/licenses/LabVIEW-MathScriptRT-${_release}/PATENTS.txt"
}

# vim:set et sw=2 sts=2:
