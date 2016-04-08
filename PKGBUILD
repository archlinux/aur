# Maintainer: Matt Harrison <matt@harrison.us.com>
# Original Author: Erik van der Kolk <developer at smerik dot nl>
# Contributor: Hong Xu

pkgname=editorconfig-core-c
pkgver=0.12.1
pkgrel=1
pkgdesc="EditorConfig core code written in C (for use by plugins supporting EditorConfig parsing)"
arch=('i686' 'x86_64')
url="https://github.com/editorconfig/editorconfig-core-c"
license=('BSD')
depends=('pcre')
makedepends=('cmake>=2.6')
provides=('editorconfig-core' 'editorconfig-core-c')
conflicts=('editorconfig-core')
replaces=('editorconfig-core<=0.10.0')
source=("https://github.com/editorconfig/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c7bd714c73f01edde583b059b51078173aa85a36fa05bb9652d35a75fe0ac372')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg "Starting make..."
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D INSTALL_HTML_DOC=ON -D CMAKE_INSTALL_LIBDIR:PATH=lib .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  msg "Including license..."
  install -v -D -m 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
