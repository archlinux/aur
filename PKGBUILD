# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='dpscreenocr'
pkgname="${_pkgname}-git"
pkgver=1.0.2.r148.g533c91a
pkgrel=1
pkgdesc='Recognize text on screen'
arch=('x86_64')
url='https://danpla.github.io/dpscreenocr/'
_url_source='https://github.com/danpla/dpscreenocr'
license=('zlib')
depends=('hicolor-icon-theme' 'qt5-base' 'tesseract')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${_url_source}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C 'build' install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
  install -Dm644 "${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
# vim: ts=2 sw=2 et:
