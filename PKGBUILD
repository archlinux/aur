# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kdb
pkgver=3.0.0
pkgrel=2
pkgdesc="A database connectivity and creation framework for various database vendors"
arch=(i686 x86_64)
url="http://www.kexi-project.org/"
license=(GPL2)
depends=(kcoreaddons)
makedepends=(extra-cmake-modules python2 libmariadbclient postgresql ki18n)
optdepends=('mariadb: MySQL plugin' 'postgresql: PostgreSQL plugin')
source=("http://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha1sums=('90265f8436fc19136a9ed709fae4e6413f0cfa3b'
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
