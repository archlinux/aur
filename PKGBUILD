# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kreport
pkgver=3.0.1
pkgrel=1
pkgdesc="A framework for creation and generation of reports in multiple formats"
arch=(i686 x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kproperty qt5-declarative)
makedepends=(extra-cmake-modules python2 ki18n marble-common)
optdepends=('marble-common: support for maps in reports')
source=("http://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz")
sha1sums=('08f2cda7cd14bafcfb8afc85d851192a3dba7ca5')
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
