# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=pdfquirk
pkgver=0.93
pkgrel=1
pkgdesc='Create PDFs from images or scanner'
arch=('x86_64')
url='https://dragotin.github.io/quirksite/'
license=('GPL3')
depends=('hicolor-icon-theme' 'imagemagick' 'qt5-base')
makedepends=('extra-cmake-modules' 'glu')
optdepends=('sane: scanning support')
source=("https://github.com/dragotin/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d961493b2fea213e630e25a312b80f2326ac6578346e5a11458ad31c80ebfd83')

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