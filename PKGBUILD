# Author: Roman Gilg <subdiff@gmail.com>

pkgname=disman-kwinft
pkgver=5.19.0_beta
_pkgname=0.519.0-beta.0
pkgrel=1
pkdesc='Qt/C++ display management library'
arch=(x86_64)
url="https://gitlab.com/kwinft/disman"
license=(LGPL)
depends=('kxmlgui' 'libkscreen-git' 'qt5-graphicaleffects' 'hicolor-icon-theme')
provides=("disman")
conflicts=("disman")
makedepends=(extra-cmake-modules)
source=("https://gitlab.com/kwinft/disman/-/archive/disman@$_pkgname/disman-disman@$_pkgname.tar.gz")
md5sums=('5f19ba9e3ab6362a72e24f2c3973fd6f')

prepare() {
  tar -xvf disman-disman@$_pkgname.tar.gz
  mkdir -p "$srcdir"/build/make
}
  
build() {
  cd "$srcdir"/build
  cmake "$srcdir/disman-disman@$_pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
