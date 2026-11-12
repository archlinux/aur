# Maintainer: Alexander R. <srwork@gmail.com>

pkgname=meld-qt
pkgver=1.0.0
pkgrel=1
pkgdesc="Visual diff and merge tool"
url="https://github.com/Alexander-r/meld-qt"
license=('MIT')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('qt6-tools' 'cmake')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/Alexander-r/meld-qt/tar.gz/refs/tags/v${pkgver}")
sha256sums=('5b4d9902604e91f66e2460a1b392f055069e5f7ac751ef3d410b407d7bf46d2f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -B build \
    -DMELD_SINGLE_INSTANCE_NETWORK=ON \
    -DMELD_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
