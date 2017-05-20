# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Corey Richardson <corey@octayn.net>

pkgname=krita-git
pkgver=3.0.91.1366.gdc2c6aaddc-1
pkgrel=1
pkgdesc="A free digital painting application. Digital Painting, Creative Freedom! (GIT Version)"
arch=('i686' 'x86_64')
url='http://www.krita.org'
license=('GPL3')
depends=(kio kitemmodels gsl libraw exiv2 openexr python fftw curl boost-libs hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools boost eigen vc poppler-qt5 opencolorio)
optdepends=('poppler-qt5: PDF filter' 'ffmpeg: to save animation' 'opencolorio: for the LUT docker')
provides=('krita' 'calligra-krita')
conflicts=('krita' 'calligra-krita')
source=('git+https://github.com/KDE/krita.git')
sha1sums=('SKIP')

pkgver() {
  cd krita
  git describe --tags |sed 's+-+.+g'|sed 's+^v++'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../krita \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DPACKAGERS_BUILD=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
