# Maintainer: Ramon Buldó <rbuldo@gmail.com>

pkgname=gtk-theme-breath
pkgver=5.9.0
pkgrel=1
_gitcommit=da2706640f457f89de6c26312e391b244ff550b4
pkgdesc="Breath widget theme for GTK 2 and 3"
arch=(any)
url='https://github.com/manjaro/artwork-breath-gtk'
license=(LGPL)
makedepends=(extra-cmake-modules qt5-tools)
source=("breath-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
sha256sums=('c1ea830c7add04ff76b280a888b68d972133c0cfbde3f96543c779c3b7ae669d')

prepare(){
  mv artwork-breath-gtk-$_gitcommit $pkgname
  mkdir -p build
}

build(){
  cd build
  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_GTK3_VERSION=3.20
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
