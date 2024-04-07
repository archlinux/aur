# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>
pkgname=fontobene-qt
pkgver=1.0.0
pkgrel=1
pkgdesc="FontoBene font parser library for C++ / Qt"
arch=('any')
url="https://github.com/fontobene/fontobene-qt/"
license=('Apache-2.0')
depends=('qt6-base')
makedepends=('cmake')
source=(
  "fontobene-qt-${pkgver}-source.tar.gz::https://github.com/fontobene/$pkgname/archive/$pkgver.tar.gz"
  "fontobene-qt.pc"
)
sha256sums=(
  '4e66c04c788a682a53bef89f4a0f092c33c4c231fbf8b47fcf7a8de80f6e161c'
  '09fff2e64fdd990274c6d3f43109777b528a96433f2c7169b7deb3457700bb78'
)

build() {
  # Build tests
  cd "$srcdir/"
  rm -rf build
  mkdir build && cd build
  cmake ../fontobene-qt-${pkgver}/ -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  make
}

check() {
  # Run unit tests
  cd "$srcdir/build"
  tests/fontobene-qt-tests
}

package() {
  # Install headers
  cd "$srcdir/build"
  make install

  # Install pkg-config file
  install -Dm644 -o root -g root "$srcdir/fontobene-qt.pc" "$pkgdir/usr/lib/pkgconfig/fontobene-qt.pc"
}

# vim:set ts=2 sw=2 et:
