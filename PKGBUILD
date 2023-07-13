# Maintainer:‌ dreieck
# Contributor: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=raplcap
pkgver=0.9.0
pkgrel=1
pkgdesc="RAPL power capping C interface with multiple implementations"
arch=('x86_64')
url="https://github.com/powercap/raplcap"
license=('BSD-3')
depends=(
  'powercap'
)
makedepends=(
  'cmake'
)
source=(
  "https://github.com/powercap/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '645f12be75d731b2ce847356a0d32e9c8c0a44791b8337185a383656ffc92121'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p _build
    cd _build
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DRAPLCAP_CONFIGURE_MSR_EXTRA=ON \
      ..
    make
}

package() {
     cd "${srcdir}/${pkgname}-${pkgver}"
     cd _build
     make DESTDIR="${pkgdir}" install
}
