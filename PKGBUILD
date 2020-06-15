# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=pdfquirk
pkgver=0.91
pkgrel=3
pkgdesc='Create PDFs from images or scanner'
arch=('x86_64')
url='https://dragotin.github.io/quirksite/'
license=('GPL3')
depends=('hicolor-icon-theme' 'imagemagick' 'qt5-base')
makedepends=('extra-cmake-modules' 'glu')
optdepends=('sane: scanning support')
source=("https://github.com/dragotin/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f6aed0c2f5eb2056c47948ef321f614b9fba7b44fe968bb878661e7469ca3bfa')

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C build install
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et: