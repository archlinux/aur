# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive
pkgver=0.1.1
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
depends=('ffmpeg' 'qt5-multimedia' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
optdepends=('frei0r-plugins' 'olive-community-effects-git')
source=("${pkgver}.tar.gz::https://github.com/olive-editor/olive/archive/${pkgver}.tar.gz"
        'olive_tr.ts')
sha512sums=('72aefc03956b3a64d4fb69d15f9a5c88429e8988dac7a6f10287265c065e7b85cb7c6c63ea35e07aef34cdc71e6a3611a8622a1916163c08182bab227d8555e1'
            '443ba088018e97597dc5e7209d2493276ebbc15576e4fe638c8f486088ea0041f681693dc3939fba06b7fb4a0ffd289d5e87d36b82753e4c7742659f95a46067')

prepare() {
  if [ -d build ]
  then
    rm -rf build
  fi

  mkdir build

  cp "$srcdir/olive_tr.ts" "$srcdir/$pkgname-$pkgver/ts/"
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
