# Maintainer: Simon Repp <simon@fdpl.io>

arch=('i686' 'x86_64')
conflicts=('ommpfritt')
depends=('kitemmodels' 'lib2geom-git' 'poppler-qt5' 'python' 'qt5-base' 'qt5-svg')
license=('GPL3')
makedepends=('cmake' 'git' 'pybind11' 'qt5-imageformats' 'qt5-tools' 'qt5-translations')
md5sums=(
  '39e4dba5aa7eff71507a96c49457edcc'
  'SKIP'
)
pkgdesc="Semantic, procedural, non-destructive vector modelling"
pkgname=ommpfritt-git
pkgrel=2
pkgver=0.1.3.r568.g62a6fe81
provides=('ommpfritt')
source=(
  ommpfritt.desktop
  "ommpfritt::git+https://github.com/pasbi/ommpfritt.git"
)
url="https://github.com/pasbi/ommpfritt"

build() {
  cd "${srcdir}"/ommpfritt
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DQT_QM_PATH=/usr/share/qt/translations \
        ..
  make -j2
}

package() {
  cd "${srcdir}"
  install -Dm644 ommpfritt.desktop "${pkgdir}"/usr/share/applications/ommpfritt.desktop

  cd "${srcdir}"/ommpfritt/build
  install -Dm755 ommpfritt "${pkgdir}"/usr/bin/ommpfritt
}

pkgver() {
    cd ommpfritt
    git describe --exclude continuous --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
