# Maintainer: Chih-Hsuan Yan <yan12125@gmail.com>
# Contributor: Marcin Mikołajczak <me@m4sk.in>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lximage-qt6
pkgname=$_pkgname-git
pkgver=1.2.0.16.gfc9ff64
pkgrel=1
pkgdesc="The LXQt image viewer"
arch=("i686" "x86_64")
url="https://lxqt.org"
license=("GPL2")
depends=("libfm-qt6-git" "qt6-svg" "hicolor-icon-theme" "libexif")
optdepends=(
  "qt6-imageformats: support for additional image formats (WEBP, TIFF, etc.)"
)
makedepends=("git" "cmake" "qt6-tools" "lxqt-build-tools-qt6-git")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "${_pkgname/6/}")
source=("git+https://github.com/lxqt/lximage-qt.git#branch=wip_qt6")
sha256sums=('SKIP')

pkgver() {
  cd lximage-qt
  git describe --always | sed "s/-/./g"
}

prepare() {
  cd lximage-qt
  mkdir -p build
}

build() {
  cd lximage-qt/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd lximage-qt/build
  make DESTDIR="$pkgdir" install
}
