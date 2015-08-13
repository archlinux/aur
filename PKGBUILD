# Original Author: Erik van der Kolk <developer at smerik dot nl>
# Maintainer: Hong Xu
pkgname=editorconfig-core-c
pkgver=0.12.0
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
source=("http://sourceforge.net/projects/editorconfig/files/EditorConfig-C-Core/0.12.0/source/editorconfig-core-c-0.12.0.tar.gz/download")
md5sums=('b2eefcc47656f4166f3326eeeaddc076')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg "Starting make..."
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D INSTALL_HTML_DOC=ON .
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  msg "Including license..."
  install -v -D -m 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
