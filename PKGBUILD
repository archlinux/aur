# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>
pkgbase=fontobene-qt
pkgname=(fontobene-qt-qt6)
pkgver=1.0.0
pkgrel=2
pkgdesc="A header-only library to parse FontoBene stroke fonts with C++/Qt"
arch=('any')
url="https://github.com/fontobene/fontobene-qt/"
license=('Apache-2.0')
depends=(qt6-base)
makedepends=(cmake)
provides=(fontobene-qt)
conflicts=(fontobene-qt)
source=(
  "$pkgbase-$pkgver-source.tar.gz::https://github.com/fontobene/$pkgbase/archive/$pkgver.tar.gz"
  "$pkgbase-qt6.pc"
)
sha256sums=(
  '4e66c04c788a682a53bef89f4a0f092c33c4c231fbf8b47fcf7a8de80f6e161c'
  'be0cc9a8029cce9997837d4ed793522d8e821b4320d9774f2e69cb158bb982dd'
)

build() {
  cmake -B build6 -S $pkgbase-$pkgver \
    -DFONTOBENE_QT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build6
}

check() {
  "$srcdir"/build6/tests/fontobene-qt-tests
}

package() {
  DESTDIR="$pkgdir" cmake --install build6
  install -Dm644 -o root -g root "$srcdir/fontobene-qt-qt6.pc" "$pkgdir/usr/lib/pkgconfig/fontobene-qt.pc"
}

# vim:set ts=2 sw=2 et:
