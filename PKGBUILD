# Author: Roman Gilg <subdiff@gmail.com>

pkgname=kdisplay-kwinft
pkgver=5.20.0
_pkgver=5.20.0
pkgrel=1
pkgdesc='App and daemon for display managing'
arch=(x86_64)
url="https://gitlab.com/kwinft/kdisplay"
license=(LGPL)
depends=('kxmlgui' 'disman' 'qt5-graphicaleffects' 'hicolor-icon-theme')
provides=(kdisplay)
conflicts=(kdisplay)
makedepends=(extra-cmake-modules)
source=("https://gitlab.com/kwinft/kdisplay/-/archive/kdisplay@$_pkgver/kdisplay-kdisplay@$_pkgver.tar.gz")
md5sums=('2fe7504c206c9f37ceb44fbd4092568e')

prepare() {
  tar -xvf kdisplay-kdisplay@$_pkgver.tar.gz
  mkdir -p "$srcdir"/build/make
}

build() {
  cd "$srcdir"/build
  cmake "$srcdir/kdisplay-kdisplay@$_pkgver" \
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
