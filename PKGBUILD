# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kexi
pkgver=3.1.0
pkgrel=1
pkgdesc="A visual database applications creator"
arch=(x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kdb kreport ktexteditor breeze-icons)
makedepends=(extra-cmake-modules qt5-tools kdoctools libmariadbclient postgresql qt5-webkit doxygen)
optdepends=('qt5-webkit: Web browser plugin')
conflicts=(calligra-kexi)
replaces=(calligra-kexi)
source=("https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('6d55cd4af177bcb060673a0977d52bc91cc2dd1b1420d008a78f9783312152fb'
            'SKIP')
validpgpkeys=(4866BAF713B465677A4059643C7C0E201B6524DB) # Jarosław Staniek <staniek@kde.org>


prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
