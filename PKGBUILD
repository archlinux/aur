# Author: Roman Gilg <subdiff@gmail.com>

pkgname=kdisplay-kwinft
pkgver=5.19.0
_pkgname=5.19.0
pkgrel=1
pkgdesc='App and daemon for display managing'
arch=(x86_64)
url="https://gitlab.com/kwinft/kdisplay"
license=(LGPL)
depends=('kxmlgui' 'disman' 'qt5-graphicaleffects' 'hicolor-icon-theme')
provides=(kdisplay)
conflicts=(kdisplay kscreen)
makedepends=(extra-cmake-modules)
source=("https://gitlab.com/kwinft/kdisplay/-/archive/kdisplay@$_pkgname/kdisplay-kdisplay@$_pkgname.tar.gz")
md5sums=('4a491c0a0f6d159e8e1137882a11cf08')

prepare() {
  tar -xvf kdisplay-kdisplay@$_pkgname.tar.gz
  mkdir -p "$srcdir"/build/make
}

build() {
  cd "$srcdir"/build
  cmake "$srcdir/kdisplay-kdisplay@$_pkgname" \
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
