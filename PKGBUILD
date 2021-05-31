# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gcstr
pkgver=4.0.0
pkgrel=1
pkgdesc='Safe garbage collected strings for C, inspired by Go'
arch=(x86_64)
url='https://github.com/xyproto/gcstr'
license=(BSD)
makedepends=(cmake git ninja)
depends=(gc)
source=("git+$url#commit=176bd77ec0846df1839d1ebe0fea02d3f19e5b6f") # tag: 4.0.0
b2sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
