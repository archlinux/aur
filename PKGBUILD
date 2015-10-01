# Maintainer:  Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft
pkgver=0.59
pkgrel=1
pkgdesc="A program suitable for all trades or crafts"
arch=('i686' 'x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL')
depends=('kdepimlibs' 'ctemplate' 'python2-reportlab' 'python2-pypdf')
makedepends=('cmake' 'automoc4' 'boost')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        'allow-duplicate-cmake-targets.patch')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i 's/raise ValueError, "Not enough space"/raise ValueError("Not enough space")/' tools/erml2pdf.py

  patch < "${srcdir}/allow-duplicate-cmake-targets.patch"

  rm -rf build
  mkdir -p build
  cd build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ".." \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install
}

sha256sums=('e05ff0b78a073bafffa5c0e41fe458461216b66fd57fc9432a1064a7be2b2034'
            '2a98be3f535be36161c16ee1f49baba72eab410f222cfc32697c490cfd412370')
