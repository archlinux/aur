# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=qterminal
pkgname=$_pkgname-git
pkgver=2.2.1.5.g1233838
pkgrel=1
pkgdesc="Lightweight Qt-based terminal emulator"
arch=("i686" "x86_64")
url="https://github.com/lxqt/qterminal"
license=("GPL2")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=("qtermwidget-git" "qt6-translations" "libcanberra" "layer-shell-qt")
makedepends=("cmake" "git" "lxqt-build-tools-git" "qt6-tools"
             # Not actually needed, to be fixed in https://github.com/lxqt/qterminal/pull/1110
             "qt6-5compat" )
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/./g"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
