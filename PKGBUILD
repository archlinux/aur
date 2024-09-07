# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=ember-plus
pkgver=1.8.2.2
pkgrel=2
pkgdesc="Ember+ control protocol - Slick and free for all!"
arch=('x86_64')
url="https://github.com/Lawo/ember-plus"
license=('BSL-1.0')
depends=('gcc-libs' 'glibc' 'qt5-base')
makedepends=('cmake')
options=(!emptydirs !lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Lawo/ember-plus/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('67414fb0e6a169540b17f713201214b5c1a1b6e89d394d06caaddc6001f73fe6')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -G 'Unix Makefiles' \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -vDm644 "${pkgname}-${pkgver}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Documentation
  install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" ${srcdir}/${pkgname}-${pkgver}/documentation/*.pdf
}

# vim:set ts=2 sw=2 et:
