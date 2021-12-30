# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=pdfquirk
pkgver=0.95
pkgrel=1
pkgdesc="Creating PDFs from images or scanner made easy"
arch=('x86_64')
url="https://dragotin.github.io/quirksite"
license=(GPL3)
depends=(imagemagick qt5-tools)
makedepends=(extra-cmake-modules glu)
optdepends=('sane: scanning support')
source=("https://github.com/dragotin/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e202ee2a43ffad1d8c9404d1568ed3578bf8a2763854ae6dd654866fb8635686594069911adb4bbc8bc75e433db0098b88ce242ba37c90ded2c5f534fa8b83c4')

build() {
  cmake \
    -S "${pkgname}-${pkgver}" \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm644 ${pkgname}-${pkgver}/README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
