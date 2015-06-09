# Maintainer: Kartik Mohta <kartikmohta@gmail.com>
pkgname=gtsam
pkgver=3.2.1
pkgrel=1
pkgdesc="A library of C++ classes that implement smoothing and mapping (SAM) in robotics and vision, using factor graphs and Bayes networks as the underlying computing paradigm rather than sparse matrices."
url="https://collab.cc.gatech.edu/borg/gtsam/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('boost-libs' 'intel-tbb')
makedepends=('boost')
source=("https://research.cc.gatech.edu/borg/sites/edu.borg/files/downloads/${pkgname}-${pkgver}.tgz")
md5sums=('fbbd90319c636ac41233c1b6ff9fbf75')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF -DGTSAM_BUILD_TESTS=OFF -DGTSAM_BUILD_WRAP=OFF -DGTSAM_INSTALL_CPPUNITLITE=OFF -DGTSAM_INSTALL_GEOGRAPHICLIB=OFF -DGTSAM_BUILD_DOCS=OFF
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
