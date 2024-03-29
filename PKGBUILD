# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: MatMoul <matmoul at the google email domain which is .com>

pkgname=qt-sudo
pkgver=0.0.0.r1.9028265
pkgrel=5
pkgdesc='A clone of LXQt sudo tool, without LXQt libs'
arch=('x86_64')
url='https://github.com/aarnt/qt-sudo.git'
license=('LGPL2.1')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5Widgets.so
  'sudo'
)
makedepends=(
  'git'
  'qt5-tools'
)
source=("git+https://github.com/aarnt/qt-sudo.git#commit=90282654601767c69e564be81e8c33ab4e7c9095")
sha256sums=('SKIP')

build() {
  cd qt-sudo
  echo "Starting build..."
  qmake-qt5 PREFIX="${pkgdir}/usr" QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}"
  make
}

package() {
  cd qt-sudo
  make install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
