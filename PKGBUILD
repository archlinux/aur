# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gcstr
pkgver=3.0.0
pkgrel=1
pkgdesc='Safe garbage collected strings for C, inspired by Go'
arch=(x86_64)
url='https://github.com/xyproto/gcstr'
license=(BSD)
makedepends=(cmake git ninja)
depends=(gc)
source=("git+$url#commit=cfb75eb0d6953b31f42c4834332db7460dc8ea2a") # tag: 3.0.0
b2sums=('SKIP')

build() {
  mkdir build
  cd build
  cmake ../$pkgname \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  cd $pkgname
  install -Dm644 $pkgname.pc "$pkgdir/usr/lib/pkgconfig/$pkgname.pc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
