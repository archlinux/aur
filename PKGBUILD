# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>

pkgname=siril
pkgver=0.99.6
pkgrel=3
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('gtk3' 'fftw' 'cfitsio' 'gsl' 'libconfig' 'opencv')
makedepends=('intltool' 'cmake')  
url="https://www.siril.org/"
optdepends=('libpng: PNG import'
            'libjpeg: JPEG import and export'
            'libtiff: TIFF import and export'
            'libraw: DSLR RAW images import'
            'ffms2: films native support as image sequences and import'
            'libcurl-gnutls: check for updates'
            'gnuplot: photometry graphs creation')

source=("https://free-astro.org/download/siril-${pkgver}.tar.bz2")
sha1sums=('7a2689c6843e9c4bf97f225bb91a27600f543f79')

build() {
  CFLAGS='-fcommon' ./autogen.sh --prefix=/usr
  make
}

package() {
  make DESTDIR="${pkgdir}" install
  install -v -d ${pkgdir}/usr/share/applications/
  install -v -d ${pkgdir}/usr/share/mime/packages/
  install -v -m 644 platform-specific/linux/org.free_astro.siril.desktop ${pkgdir}/usr/share/applications/
  install -v -m 644 platform-specific/linux/siril.xml ${pkgdir}/usr/share/mime/packages/
}
