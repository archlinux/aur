# Maintainer: Pablo Romano <promano@protonmail.com>

pkgname=notepadng
pkgver=0.1.0
pkgrel=1
pkgdesc='Notepad++-like editor for programmers and power users'
arch=('x86_64')
url='https://github.com/kravich/notepadng'
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'qscintilla-qt6'
  'qt6-5compat'
  'qt6-base'
  'qt6-svg'
  'uchardet'
)
makedepends=(
  'cmake'
  'qt6-tools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kravich/notepadng/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('306ee08018e3972234347a65a07ff7ebcbfe9eb7bdc08600489935f86d958364')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DWITH_QT=QT6

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
