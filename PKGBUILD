# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive
pkgver=0.1.2
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
depends=('ffmpeg' 'qt5-multimedia' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
optdepends=('frei0r-plugins' 'olive-community-effects-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/olive-editor/olive/archive/$pkgver.tar.gz")
sha512sums=('48cf44b5ba1bd95e20efb5312d61d6c37e6dedc1f02156ef436ab51705be4bdaf5bb68875b55b06337c25a34aee23eac645fe295d08ab0038872adccf12fc95e')

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
        ../$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
