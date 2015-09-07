# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Andreas Hauser <andy-aur@splashground.de>

set -u
pkgname='ploticus'
pkgver='2.41'
pkgrel='1'
pkgdesc='produce plots and graphs in GIF, PNG, PostScript, SVG from CSV like data'
arch=('i686' 'x86_64')
url='http://ploticus.sourceforge.net/doc/welcome.html'
license=('GPL')
depends=('gd' 'libpng' 'libjpeg' 'freetype2' 'zlib' 'libx11')
sha256sums=('ecccb6afcf0008d5b31da2e9e74c448564101eb7b9bbde758a3dca1f2dc8c580'
            'f0b1acc10a35b1d3c4268ee67c2520af36044991e289d538c1cb5b7bc406d4e4')
source=("http://prdownloads.sourceforge.net/sourceforge/${pkgname}/pl${pkgver/./}src.tar.gz"
  'Makefile.patch')

prepare() {
  set -u
  cd "${srcdir}/pl${pkgver/./}src/src"
  patch -Np2 -i "${srcdir}/Makefile.patch"
  set +u
}

build() {
  set -u
  cd "${srcdir}/pl${pkgver/./}src/src"
  make -s -j "$(nproc)" CC='gcc -O'
  set +u
}

package() {
  set -u
  cd "${srcdir}/pl${pkgver/./}src/src"
  install -Dpm755 'pl' -t "${pkgdir}/usr/bin/"
  install -Dpm644 '../man/man1/pl.1' -t "${pkgdir}/usr/share/man/man1/"
  install -Dpm644 '../prefabs'/* -t "${pkgdir}/usr/share/ploticus/"
  set +u
}
set +u
