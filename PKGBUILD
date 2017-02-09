# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fluid
pkgver=0.7.90.20160918
_commit=787254193324a16de39732506c9770ea8ef6ed44
pkgrel=1
pkgdesc="A collection of cross-platform QtQuick components for building fluid and dynamic applications"
arch=("i686" "x86_64")
url="https://github.com/qmlos/fluid"
license=("GPL")
depends=("qt5-base" "qt5-declarative" "qt5-quickcontrols" "qt5-quickcontrols2")
makedepends=("git" "extra-cmake-modules")
source=("git+https://github.com/qmlos/fluid.git#commit=$_commit"
        "git+https://github.com/google/material-design-icons.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  mkdir -p build

  cd $pkgname
  git clone "$srcdir/material-design-icons" icons
  scripts/fetch_icons.sh

  rm -r icons/.git
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
