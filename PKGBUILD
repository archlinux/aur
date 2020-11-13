# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>

pkgname=luminancehdr-git
pkgver=2.5.1.r245.g7dc448a6
pkgrel=1
pkgdesc='Open source graphical user interface application that aims to provide a workflow for HDR imaging'
arch=('x86_64')
url='http://qtpfsgui.sourceforge.net/'
license=('GPL')
depends=('exiv2' 'fftw' 'gsl' 'lcms2' 'libraw' 'openexr' 'qt5-webengine' 'qt5-svg'
         'qt5-webkit' 'ccfits' 'desktop-file-utils' 'hicolor-icon-theme' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'eigen' 'gtest' 'qt5-tools' 'patch')
optdepends=('hugin: align image stack functionality')
provides=('luminancehdr')
conflicts=('luminancehdr')
options=('!emptydirs')
source=('git+https://github.com/LuminanceHDR/LuminanceHDR.git'
        'cmake-build-type.patch')
b2sums=('SKIP'
        '759f5b096f4b72cb9a11e24d5e31983ba26d0b84d67e85d25551f482b88e0366ac0996020b6ae5f2a3340c8be9e6f2ed5fb5b52d59754ff3d7e9829796910c82')

pkgver() {
  cd "${srcdir}"/LuminanceHDR
  git describe --long | sed 's/^v\.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"/LuminanceHDR
  git apply -3 ../cmake-build-type.patch
}

build() {
  mkdir -p build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
     "${srcdir}"/LuminanceHDR
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
