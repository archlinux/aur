# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kreport
pkgver=3.0.0
pkgrel=2
pkgdesc="A framework for creation and generation of reports in multiple formats"
arch=(i686 x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kproperty qt5-declarative)
makedepends=(extra-cmake-modules python2 ki18n marble-common)
optdepends=('marble-common: support for maps in reports')
source=("http://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha1sums=('7f76aa52952aff2b52d9d5f1e88686f5158a2fc3'
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
