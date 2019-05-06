# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive
pkgver=0.1.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
depends=('ffmpeg' 'qt5-multimedia' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
optdepends=('frei0r-plugins' 'olive-community-effects-git')
source=("${pkgver}.tar.gz::https://github.com/olive-editor/olive/archive/${pkgver}.tar.gz")
sha512sums=('25889ed40e7dc379eda99bde0c63192e24ef0c7a21b70f3005ecb713f15855727950fbc248160d67d3afe053bfc3222d24e5b6aa8232581b3e2758b3226c86d8')

prepare() {
  if [ -d build ]
  then
    rm -rf build
  fi

  mkdir build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ../$pkgname
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
