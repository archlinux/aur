# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kexi
pkgver=3.1.0
pkgrel=2
pkgdesc="A visual database applications creator"
arch=(x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kdb kreport ktexteditor breeze-icons)
makedepends=(extra-cmake-modules qt5-tools kdoctools mariadb-libs postgresql qt5-webkit doxygen)
optdepends=('qt5-webkit: Web browser plugin')
conflicts=(calligra-kexi)
replaces=(calligra-kexi)
source=("https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig}
        '0001-fix-build-with-qt-5-11.patch')
sha256sums=('6d55cd4af177bcb060673a0977d52bc91cc2dd1b1420d008a78f9783312152fb'
            'SKIP'
            'f8daf1f5c366bb5a01be20f81b86bb5081d4355fecd81b90e4c5016a8e97c106')
validpgpkeys=(4866BAF713B465677A4059643C7C0E201B6524DB) # Jarosław Staniek <staniek@kde.org>


prepare() {
  mkdir -p build

  cd $pkgname-$pkgver

  patch -Np1 < ../0001-fix-build-with-qt-5-11.patch
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
