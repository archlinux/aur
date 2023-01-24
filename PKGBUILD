# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-qt6plugin
pkgname=$_pkgname-git
pkgver=1.2.0.2.g39513e5
pkgrel=1
pkgdesc="LXQt platform integration for Qt"
arch=("i686" "x86_64")
url="https://lxqt.org"
license=("GPL2")
depends=("libdbusmenu-qt6" "libqt6xdg-git" "libfm-qt6-git")
makedepends=("git" "cmake" "qt6-tools" "lxqt-build-tools-qt6-git")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/lxqt/lxqt-qtplugin.git#branch=wip_qt6")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/./g"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
