# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=liri-cmake-shared
pkgver=2.0.0
pkgrel=1
pkgdesc="Extra imports and modules for Cmake"
arch=('any')
url='https://liri.io'
license=('BSD')
depends=('extra-cmake-modules')
groups=('liri')
source=("https://github.com/lirios/cmake-shared/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a5083e126ec92c2b36396d320c7def58e10c77497a4e3240a6371821df0c74d4')

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
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname/
}
