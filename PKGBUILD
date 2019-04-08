# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kexi
pkgver=3.2.0
pkgrel=1
pkgdesc="A visual database applications creator"
arch=(x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kdb kreport ktexteditor breeze-icons hicolor-icon-theme)
makedepends=(extra-cmake-modules qt5-tools kdoctools mariadb-libs postgresql qt5-webkit doxygen marble-common)
optdepends=('qt5-webkit: Web browser plugin')
conflicts=(calligra-kexi)
replaces=(calligra-kexi)
source=("https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig})
md5sums=('90ac376276be2f5a8f6eca537ca5fd0c'
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
