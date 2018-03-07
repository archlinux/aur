# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kreport
pkgver=3.1.0
pkgrel=1
pkgdesc="A framework for creation and generation of reports in multiple formats"
arch=(x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kproperty qt5-declarative)
makedepends=(extra-cmake-modules python qt5-tools marble-common)
optdepends=('marble-common: support for maps in reports')
source=("https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('3b6485629b5e4343b7ddf42efb1927310d60b143a22afe79925147d0ddcdf36c'
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
