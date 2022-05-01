# Maintainer: Sebastian Ehlert  <awvwgk at gmail dot com>

pkgname=dftd4
pkgver=3.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/dftd4/dftd4"
depends=('gcc-fortran'
         'openblas'
         'lapack')
makedepends=('meson'
             'ninja'
             'asciidoctor')
license=('LGPL3')
pkgdesc="A Generally Applicable Atomic-Charge Dependent London Dispersion Correction"
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/dftd4/dftd4/releases/download/v$pkgver/dftd4-$pkgver-source.tar.xz")
sha256sums=('24fcb225cdd5c292ac26f7d3204ee3c4024174adb5272eeda9ae7bc57113ec8d')

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
