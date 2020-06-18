pkgname=fcitx-tablet
pkgver=1.1
pkgrel=2
pkgdesc="Handwriting tablet support for fcitx"
arch=('i686' 'x86_64')
url="https://github.com/ohwgiles/fcitx-tablet"
license=('GPL')
provides=('fcitx-tablet')
depends=('fcitx>=4.2.2' 'zinnia')
optdepends=('zinnia-tomoe: handwriting model files for zinnia')
makedepends=('cmake' 'intltool')
source=($pkgname-$pkgver.tar.gz::https://github.com/ohwgiles/fcitx-tablet/tarball/v$pkgver)
sha1sums=('ee0a79bf93e1c331e0bede30e3bcfd09d2058618')

prepare() {
   sed s/-Werror// -i "$srcdir/ohwgiles-fcitx-tablet-abbb5f5/CMakeLists.txt"
}

build() {
   rm -rf build
   mkdir build
   cd build
   cmake "$srcdir/ohwgiles-fcitx-tablet-abbb5f5" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

package() {
   cd build
   make DESTDIR=$pkgdir install
}
