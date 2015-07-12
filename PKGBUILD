# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>

pkgbase=calligra
pkgname=krita
pkgver=2.9.6
pkgrel=1
pkgdesc="Digital painting and illustration suite (stand-alone)."
arch=('i686' 'x86_64')
url="http://www.krita.org/"
license=('GPL2')
depends=('eigen' 'fftw' 'glew' 'gsl' 'kdebase-runtime' 'libkdcraw' 'opencolorio' 'boost-libs' 'curl' 'poppler-qt4')
makedepends=('automoc4' 'boost' 'cmake' 'lcms2' 'openjpeg' 'vc')
provides=('calligra-krita')
conflicts=('calligra-krita' 'calligra-plugins' 'calligra-libs' 'calligra-extras' 'calligra-filters')
install=krita.install
source=("http://download.kde.org/stable/${pkgbase}-${pkgver}/${pkgbase}-${pkgver}.tar.xz")
sha256sums=('78564137133e2f45065085df66ce2ab31478517c10163a06ba690a2d3a98a184')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  mkdir -p ${pkgname}-build
}

# Remove comment markers only if building with vc on Haswell
build() {
  cd "${srcdir}/${pkgbase}-${pkgver}/${pkgname}-build"
  cmake ../ \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DPRODUCTSET=KRITA \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_Soprano=OFF #\
    #-DTARGET_ARCHITECTURE=none \
    #-DCMAKE_CXX_FLAGS="-fabi-version=0 -march=native"
  make
}

package_krita() {
  cd "${srcdir}/${pkgbase}-${pkgver}/${pkgname}-build"
  make DESTDIR="$pkgdir" install
}
