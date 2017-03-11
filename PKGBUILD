# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kproperty
pkgver=3.0.1
pkgrel=1
pkgdesc="A property editing framework with editor widget similar to what is known from Qt Designer"
arch=(i686 x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kwidgetsaddons kguiaddons kcoreaddons kconfig)
makedepends=(extra-cmake-modules python ki18n)
source=("http://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha1sums=('1a707aa036764514e35c2c435b7dbb44ba29147a'
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
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
