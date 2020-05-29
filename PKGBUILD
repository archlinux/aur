# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kexi
pkgver=3.2.0
pkgrel=2
pkgdesc="A visual database applications creator"
arch=(x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kdb kreport ktexteditor breeze-icons hicolor-icon-theme)
makedepends=(extra-cmake-modules qt5-tools kdoctools mariadb-libs postgresql qt5-webkit doxygen)
optdepends=('qt5-webkit: Web browser plugin')
source=("https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig}
         kexi-qt-5.13.patch::"https://invent.kde.org/office/kexi/-/commit/511d99b7.patch")
sha256sums=('7a813f9ea815a09c1e733d0e7dc879c64eee85f075389e87e6aab99cf0c1c1ff'
            'SKIP'
            'e45a50be99bb8d18414c8b55cc7bcdb989b363c16aeeaaf4bced1d61c6b1e419')
validpgpkeys=(4866BAF713B465677A4059643C7C0E201B6524DB) # Jarosław Staniek <staniek@kde.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 -i ../kexi-qt-5.13.patch # Fix build with Qt 5.13
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
