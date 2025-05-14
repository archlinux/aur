# Maintainer: Reim-developer <contact.kaxtr@gmail.com>
pkgname=zclipboard
pkgver=1.0.1
pkgrel=1
pkgdesc="A modern, fast clipboard manager"
arch=('x86_64')
url="https://github.com/reim-developer/zclipboard "
license=('GPL-3.0')
depends=('qt6-base' 'clang')
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/reim-developer/zclipboard/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/zClipboard-$pkgver" || exit 1

  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/zClipboard-$pkgver/build" || exit 1

  make DESTDIR="$pkgdir/" install

  install -Dm644  ../zclipboard.desktop "$pkgdir/usr/share/applications/zclipboard.desktop"
  install -Dm644 ../icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/icon.png"
}