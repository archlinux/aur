# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=pdfquirk
pkgname=${_pkgname}-git
pkgver=r35.0d79759
pkgrel=2
pkgdesc='Create PDFs from images or scanner'
arch=('x86_64')
url='https://dragotin.github.io/quirksite/'
license=('GPL3')
depends=('hicolor-icon-theme' 'imagemagick' 'qt5-base')
makedepends=('extra-cmake-modules' 'git' 'glu')
optdepends=('sane: scanning support')
provides=("${_pkgname}")
source=("git+https://github.com/dragotin/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C build install
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et: