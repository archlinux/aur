# Maintainer: dreieck

_pkgname="gmaptool"
pkgname="${_pkgname}-static-bin"
pkgver=0.8.220.853b
_downloadver="$(awk -F. '{print $1$2$3}' <<<"${pkgver}")"
pkgrel=1
pkgdesc="Program for splitting, merging and manipulating maps in Garmin format."
url="http://www.gmaptool.eu/en/content/gmaptool"
license=("custom: CC BY-SA 3.0" "LGPL2.1")
arch=("x86_64" "i686")
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-static=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
depends=()
source=("http://www.gmaptool.eu/sites/default/files/lgmt${_downloadver}.zip")
sha256sums=("1bfb6cf8e3c13f841000fa025084c9c3d6f7a468a4a0d68753f01f8ab2069660")

pkgver() {
  cd "${srcdir}"
  ./gmt | head -n1 | awk '{print $2}' | sed 's|^[vV]||'
}

package(){
  cd "${srcdir}"

  install -D -v -m755 gmt "${pkgdir}/usr/bin/gmaptool"
  install -D -v -m644 readme.txt "${pkgdir}/usr/share/doc/${_pkgname}/readme.txt"
  install -D -v -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license-gmaptool.CC_BY-SA_3.0.txt"
  install -D -v -m644 lgpl-2.1.txt "${pkgdir}/usr/share/licenses/${pkgname}/license-linkedlibraries.LGPL-2.1.txt"
}


