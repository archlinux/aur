# Maintainer:  Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft
pkgver=0.53
pkgrel=1
pkgdesc="A program suitable for all trades or crafts"
arch=('i686' 'x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL')
depends=('kdepimlibs' 'ctemplate' 'python2-reportlab' 'python2-pypdf')
makedepends=('cmake' 'automoc4' 'boost')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")

build() {
  cd "${srcdir}"
  rm -rf build
  mkdir -p build
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make

  # fix wrong exception raising (shouldn't be fatal)
  sed -i 's/raise ValueError, "Not enough space"/raise ValueError("Not enough space")/' "${srcdir}/${pkgname}-${pkgver}/tools/erml2pdf.py"
}

package() {
  cd "${srcdir}/build"
  make "DESTDIR=${pkgdir}" install
}

sha256sums=('66e40b997dea69c8b35420816b0ec22d785560f5a0aacaca49ff73825a2dba91')
