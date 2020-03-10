# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=liri-cmake-shared
pkgver=1.1.0
pkgrel=2
pkgdesc="Extra imports and modules for Cmake"
arch=('any')
url='https://liri.io'
license=('BSD')
depends=('extra-cmake-modules')
groups=('liri')
source=("https://github.com/lirios/cmake-shared/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f549cc4741e20df6f097960eef809c3119ef08b33194efee957b0c44ab9a1b79')

prepare() {
  sed -i -e 's|/qml"|/qt/qml"|' -e 's|LIBDIR/qml|LIBDIR/qt/qml|' $pkgname-$pkgver/modules/LiriBuild.cmake
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE.BSD -t "$pkgdir"/usr/share/licenses/$pkgname/
}
