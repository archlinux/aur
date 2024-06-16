# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>
# Contributor: Marc-Olivier Barre <mobarre-archlinux|at|snarchi|dot|io>

pkgname=siril
pkgver='1.2.2'
pkgrel=1
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
arch=('x86_64')
license=('GPL3')
depends=('gtk3' 'json-glib' 'fftw' 'cfitsio' 'gsl' 'libconfig' 'opencv' 'exiv2' 'gnuplot' 'ffms2')
makedepends=('meson' 'cmake' 'ninja')   
url="https://www.siril.org/"
optdepends=('libpng: PNG import'
            'libjpeg: JPEG import and export'
            'libtiff: TIFF import and export'
            'libraw: DSLR RAW images import'
            'libcurl-gnutls: check for updates'
            'gnuplot: photometry graphs creation')

source=("https://free-astro.org/download/siril-${pkgver}.tar.bz2")
sha256sums=('49b7a59011a30642f4a0d1cd6eae32eace584f425bd709fa8ecab52b5ba98adc')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  meson setup --prefix /usr --buildtype release _build
  ninja -C _build
}

package() {  
  cd "$srcdir/$pkgname-$pkgver/"
  meson install -C _build --destdir "$pkgdir"
}
