# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=pcmanfm-qt6
pkgname=$_pkgname-git
pkgver=1.2.1.14.gb7e5d1df
pkgrel=1
pkgdesc="The LXQt file manager, Qt port of PCManFM"
arch=("i686" "x86_64")
url="https://lxqt.org"
license=("GPL2")
depends=("libfm-qt6-git" "lxmenu-data")
makedepends=("git" "cmake" "qt6-tools" "lxqt-build-tools-qt6-git")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "${_pkgname/6/}")
source=("git+https://github.com/lxqt/pcmanfm-qt.git#branch=wip_qt6")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pcmanfm-qt"
  git describe --always | sed "s/-/./g"
}

build() {
  mkdir -p build
  cd build

  cmake "$srcdir/pcmanfm-qt" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
