# Maintainer: Matt Harrison <matt@harrison.us.com>
# Original Author: Erik van der Kolk <developer at smerik dot nl>
# Contributor: Hong Xu

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
source=("https://github.com/editorconfig/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a53b67aca5ba307c37e9e002fa6cc5e5399ac0099eaeeca700ad703ee6e5278b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg "Starting make..."
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D INSTALL_HTML_DOC=ON .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  msg "Including license..."
  install -v -D -m 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
