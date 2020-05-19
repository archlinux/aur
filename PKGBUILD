# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kreport
pkgver=3.2.0
pkgrel=2
pkgdesc="A framework for creation and generation of reports in multiple formats"
arch=(x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kproperty qt5-declarative)
makedepends=(extra-cmake-modules python qt5-tools marble-common doxygen qt5-doc)
optdepends=('marble-common: support for maps in reports')
source=("https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('22716d719654e8f887fe4d33654e252ddf3d3d818c44e15a8af0e6f2e7d6ccd7'
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
