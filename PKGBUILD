# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>

pkgname=siril
pkgver='1.0.6'
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
sha256sums=('f89604697ffcd43f009f8b4474daafdef220a4f786636545833be1236f38b561')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  meson --prefix /usr --buildtype release _build
  ninja -C _build
}


package() {  
  cd "$srcdir/$pkgname-$pkgver/"
  meson install -C _build --destdir "$pkgdir"
}
