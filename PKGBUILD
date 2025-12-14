# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>
# Contributor: Marc-Olivier Barre <mobarre-archlinux|at|snarchi|dot|io>
# Contributor: Michael Lass <bevan@bi-co.net>

pkgname=siril
pkgver='1.4.0'
pkgrel=1
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
url="https://www.siril.org/"
arch=('x86_64')
license=('GPL3')
depends=('gtk3' 'gtksourceview4' 'lcms2' 'cfitsio' 'wcslib' 'fftw' 'gsl' 'opencv' 'json-glib' 'ffms2')
makedepends=('meson' 'cmake' 'ninja')
optdepends=('gvfs: web access'
            'exiv2: get thumbnails from files'
            'libraw: DSLR RAW files import'
            'libtiff: TIFF import and export'
            'libxisf: XISF format support'
            'libjpeg: JPEG import and export'
            'libjxl: JPEG XL format support'
            'libheif: HEIF format files import'
            'libpng: PNG format support'
            'ffmpeg: avi export support'
            'libgit2: git integration to sync with the official siril-scripts repository')

options=(!lto)

source=("https://free-astro.org/download/siril-${pkgver}.tar.bz2")
sha256sums=('439def7c40ad783afb82e87f3c656d85b449c701f67ab0a9b97ca372ea2d73c9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  meson setup --prefix /usr --buildtype release _build
  ninja -C _build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  meson install -C _build --destdir "$pkgdir"
}
