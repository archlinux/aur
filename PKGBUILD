# Maintainer: Raphael Scholer <rascholer@gmail.com>

_pkgname="elementary-xfce"
pkgname="${_pkgname}-icons"
pkgver=0.13.1
pkgrel=1
pkgdesc='Elementary icon theme with improved Xfce support'
arch=('any')
url="https://github.com/shimmerproject/${_pkgname}"
license=('GPL2')
makedepends=('gtk3' 'optipng')
depends=('adwaita-icon-theme')
conflicts=("${pkgname}-git")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b46402629660908ec1e266b41186ee0e8662bd3a6b537e3ca5c66e5074136c11')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure --prefix="/usr/"
  make -j1
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Remove unnecessary files.
  find "${pkgdir}/usr/share/icons" \
  \( \
    -name 'AUTHORS' \
    -o -name 'CONTRIBUTORS' \
    -o -name 'LICENSE' \
  \) -delete
}
# vim:set ts=2 sw=2 et:
