# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive
pkgver=0.1.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
depends=('ffmpeg' 'qt5-multimedia' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
optdepends=('frei0r-plugins' 'olive-community-effects-git')
source=("${pkgver}.tar.gz::https://github.com/olive-editor/olive/archive/${pkgver}.tar.gz")
sha512sums=('b79d84b17408f4ba62cc3c9782ef1281eb07c040ae3ee70d8cb0fd3788a68a6134528f5c10a79284b9276f33c8e66d42de80a17122465fd10e949f51fbb4d35c')

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
