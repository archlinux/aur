# Maintainer: Arthur LAURENT <arthur.laurent4@gmail.com>

pkgname=qtcreator-devel
pkgver=6.0.2
_clangver=13.0.0
pkgrel=2
pkgdesc='QtCreator Devel component, for build plugins'
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3)
depends=(qtcreator)
makedepends=(cmake llvm python)
options=(docs)
optdepends=()
source=(https://download.qt.io/official_releases/qtcreator/${pkgver%.*}/$pkgver/qt-creator-opensource-src-$pkgver.tar.xz)
sha256sums=('')

build() {
  cmake -B build -S qt-creator-opensource-src-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DWITH_DOCS=OFF \
    -DBUILD_DEVELOPER_DOCS=OFF \
    -DBUILD_QBS=OFF \
    -DQTC_CLANG_BUILDMODE_MATCH=ON
  cmake --build build -- $MAKEFLAGS
}

package() {
  DESTDIR="$pkgdir" cmake --install build --component Devel
}
