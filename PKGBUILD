# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>

pkgname=siril
pkgver=0.99.8.1
pkgrel=1
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('gtk3' 'fftw' 'cfitsio' 'gsl' 'libconfig' 'opencv' 'exiv2' 'ffms2')
makedepends=('intltool' 'cmake' 'libpng' 'libjpeg' 'libheif' 'libtiff' 'libraw' 'ffms2' 'ffmpeg' 'curl' 'wcslib' 'libcurl-gnutls' 'gnuplot')   
url="https://www.siril.org/"
optdepends=('libpng: PNG import'
            'libjpeg: JPEG import and export'
            'libtiff: TIFF import and export'
            'libraw: DSLR RAW images import'
            'ffms2: films native support as image sequences and import'
            'libcurl-gnutls: check for updates'
            'gnuplot: photometry graphs creation')

source=("https://free-astro.org/download/siril-${pkgver}.tar.bz2")
sha256sums=("45b73ee8d1e1bd7ff184478f90da59c729ca1bd5285fb2f7ac0237c6b5cdbdb2")

build() {
  cd siril-${pkgver}
  pwd
  CFLAGS='-fcommon' ./autogen.sh --prefix=/usr
  make
}

package() {
  cd siril-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -v -d ${pkgdir}/usr/share/applications/
  install -v -d ${pkgdir}/usr/share/mime/packages/
  install -v -m 644 platform-specific/linux/org.free_astro.siril.desktop ${pkgdir}/usr/share/applications/
  install -v -m 644 platform-specific/linux/siril.xml ${pkgdir}/usr/share/mime/packages/
}
