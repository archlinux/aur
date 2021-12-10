# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ghabry <gabriel-aur mastergk de>

pkgname=rttr
pkgver=0.9.6
pkgrel=3
pkgdesc="C++ Reflection Library"
arch=(x86_64)
url="https://www.rttr.org/"
license=(MIT)
depends=(gcc-libs)
makedepends=(cmake)
source=("https://www.rttr.org/releases/rttr-$pkgver-src.tar.gz")
sha256sums=('f62caee43016489320f8a69145c9208cddd72e451ea95618bc26a49a4cd6c990')

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  # Fix incorrect file permissions after install
  sed -i 's/PERMISSIONS OWNER_READ//' CMake/*.cmake
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_UNIT_TESTS=OFF \
    -DBUILD_PACKAGE=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -Dm644 ../$pkgname-$pkgver/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
