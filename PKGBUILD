# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>

pkgname=siril
pkgver='1.0.3'
pkgrel=1
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
arch=('x86_64')
license=('GPLv3')
depends=('gtk3' 'json-glib' 'fftw' 'cfitsio' 'gsl' 'libconfig' 'opencv' 'exiv2' 'gnuplot')
makedepends=('meson' 'cmake' 'ninja')   
url="https://www.siril.org/"
optdepends=('libpng: PNG import'
            'libjpeg: JPEG import and export'
            'libtiff: TIFF import and export'
            'libraw: DSLR RAW images import'
            'ffms2: films native support as image sequences and import'
            'libcurl-gnutls: check for updates'
            'gnuplot: photometry graphs creation')

source=("https://free-astro.org/download/siril-${pkgver}.tar.bz2")
sha256sums=('2fefa7b7e1378f4ba277818c92ec7c4fca1fdcaa6df95bb65aed0163750be2c6')

build() {
  cd "$srcdir"
  meson --buildtype release _build
  ninja -C _build
}


package() {  
  cd "$srcdir"
  meson install -C _build --destdir "$pkgdir"
  # Move man to /usr/share/ as default confilicts with filesystem package 
  mkdir -p "$pkgdir"/usr/share/ 
  mv "$pkgdir"/usr/local/share/man/ "$pkgdir"/usr/share/
}
