# Maintainer: Raphael Scholer <rascholer@gmail.com>
_pkgname='elementary-xfce'
pkgname="${_pkgname}-icons-git"
pkgver=0.13.1.r25.g33dc91cb
pkgrel=1
pkgdesc='Elementary icon-theme with improved Xfce support'
arch=('any')
url="https://github.com/shimmerproject/${_pkgname}"
license=('GPL2')
makedepends=('git' 'gtk3' 'optipng')
depends=('adwaita-icon-theme')
conflicts=("${_pkgname}-icons")
provides=("${_pkgname}-icons")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed "s/^${_pkgname}.//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "${_pkgname}"

  ./configure --prefix="/usr/"
  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}" install

  # Remove unneeded files
  find "${pkgdir}/usr/share/icons" \
  -type l \
  \( \
    -name 'AUTHORS' \
    -o -name 'CONTRIBUTORS' \
    -o -name 'LICENSE' \
    -o -name 'README.md' \
  \) -delete
}
# vim:set ts=2 sw=2 et:
