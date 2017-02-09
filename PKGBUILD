# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fluid
pkgver=0.9.0
pkgrel=1
pkgdesc="Library for QtQuick apps with Material Design and Universal"
arch=("i686" "x86_64")
url="https://github.com/lirios/fluid"
license=("MPL")
depends=("qt5-svg" "qt5-quickcontrols2")
makedepends=("git" "extra-cmake-modules")
replaces=('qml-material')
source=("git+https://github.com/lirios/fluid.git#tag=v$pkgver"
        "git+https://github.com/google/material-design-icons.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  mkdir -p build

  cd $pkgname
  git clone "$srcdir/material-design-icons" material-design-icons
  scripts/fetch_icons.sh
}

build() {
  cd build
  cmake "$srcdir/$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_QMLDIR=lib/qt/qml \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
