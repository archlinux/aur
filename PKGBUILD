# Maintainer: Sebastian Ehlert  <awvwgk at gmail dot com>

pkgname=dftd4
pkgver=3.3.0
pkgrel=1
arch=('x86_64')
url="https://github.com/dftd4/dftd4"
depends=('gcc-fortran'
         'openblas'
         'lapack')
makedepends=('meson'
             'ninja')
license=('LGPL3')
pkgdesc="A Generally Applicable Atomic-Charge Dependent London Dispersion Correction"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dftd4/dftd4/archive/v${pkgver}.tar.gz")
sha256sums=('60d4f30d97cae95a7b48a99e10848ef600b605f9da98c4893a6034bded1a7f24')

build() {
  meson setup _build_${CARCH} "${srcdir}/${pkgname}-${pkgver}" \
      --buildtype=release \
      --prefix=/usr \
      -Dlapack=openblas
  meson compile -C _build_${CARCH}
}

check() {
  meson test -C _build_${CARCH} --num-processes=1
}

package() {
  DESTDIR="$pkgdir" \
  meson install -C _build_${CARCH}
}
