# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=pdfquirk
pkgver=0.93
pkgrel=2
pkgdesc="Creating PDFs from images or scanner made easy"
arch=('x86_64')
url="https://dragotin.github.io/quirksite"
license=(GPL3)
depends=(hicolor-icon-theme imagemagick qt5-base)
makedepends=(extra-cmake-modules glu)
optdepends=('sane: scanning support')
source=("https://github.com/dragotin/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('30c8c6073616f7536acaa6cb5bc9039bfcb6bbb662d01b10688b28666bb29520f94c1d97fd02d524aeed3de005a0f8ff06941576c0552421a944e7619af78a93')

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
