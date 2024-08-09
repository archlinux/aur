# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="bertini_real"
pkgname="${_name}-docs"
pkgver=1.6.1
_commit="95a90e8bca7787731ba5b300f409bea0806fe112"
pkgrel=1
pkgdesc="XHTML documentation for Bertini_real"
arch=('any')
url="https://www.bertinireal.com"
_url="https://github.com/ofloveandhate/${_name}"
license=('custom:Bertini license')
makedepends=('doxygen' 'plantuml' 'graphviz')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('25199494ed43de5f0cbffed15d108203da0308130cf3e1b0f0d6dd70621f8c47')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  sed -n 's/AC_INIT(\[bertini_real\], \[\([^]]*\)\],.*/\1/p' "configure.ac"
}

build() {
  cd "${srcdir}/${_pkgsrc}/documentation"
  doxygen "${_name}.doxy.config"
}

package() {
  cd "${srcdir}/${_pkgsrc}/documentation/generated_documentation/doc.bertinireal.com"
  install -d "${pkgdir}/usr/share/doc/${_name}/html"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_name}/html/{}" \;
}
