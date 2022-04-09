# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kproperty
pkgver=3.2.0
pkgrel=3
pkgdesc='A property editing framework with editor widget similar to what is known from Qt Designer'
arch=(x86_64)
url='https://apps.kde.org/kexi-3.3/'
license=(GPL2)
depends=(kwidgetsaddons kguiaddons kcoreaddons kconfig)
makedepends=(extra-cmake-modules python qt5-tools doxygen qt5-doc)
source=(https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('67af0c2d74715957bd5373a6a30589ff0a996cb1d267dfd0538dccaa9a768dfa'
            'SKIP')
validpgpkeys=(4866BAF713B465677A4059643C7C0E201B6524DB) # Jarosław Staniek <staniek@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
