# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=split700
pkgver=2.0
pkgrel=1
pkgdesc='Extracts BRR samples from SNES SPC700 format (*.spc)'
arch=('any')
url='https://github.com/gocha/split700'
license=('MIT')
makedepends=('cmake')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/gocha/split700/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'ba3a339840d637b5b49c702303c36362f659072fdc8d1eec77a260f68c59d40295bc16d0f9b01b6188829737bff359903ce9f575bf5e84b7571e2126f1c69d94'
)

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${srcdir}/${pkgname}-${pkgver}/README_ja.md"

  echo >&2 'Packaging binaries'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/build/brr2wav" \
    "${srcdir}/build/split700"
}
