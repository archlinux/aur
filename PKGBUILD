# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="bertini_real"
pkgname="${_name}-docs"
pkgver=1.6.0
_commit="f670751e815c31bd640b9029b5496219978951e2"
pkgrel=1
pkgdesc="XHTML documentation for Bertini_real"
arch=('any')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/${_name}"
license=('custom:Bertini license')
makedepends=('doxygen' 'plantuml' 'graphviz')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('87b51a7b6abdd265578282d9a1b13dac708be892a87f5ee8bea1f55c0e543d3a')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  sed -n 's/AC_INIT(\[bertini_real\], \[\([^]]*\)\],.*/\1/p' "configure.ac"
}

build() {
  cd "${srcdir}/${_pkgsrc}/documentation"
  doxygen "${_name}.doxy.config"
}

package() {
  cd "${srcdir}/${_pkgsrc}/documentation/generated_documentation/doc.${_name}"
  install -d "${pkgdir}/usr/share/doc/${_name}/html"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/html/{}" \;
}
