# Maintainer: Theodoros Theodiridis <theodoridisgr@gmail.com>

pkgname=sqlpp11-connector-sqlite3
pkgver=0.15
pkgrel=1
pkgdesc="A C++ wrapper for sqlite3 meant to be used in combination with sqlpp11."
arch=('any')
url="https://github.com/rbock/sqlpp11-connector-sqlite3"
license=('BSD')
depends=('sqlpp11')
makedepends=('cmake' 'git')
source=("git+https://github.com/rbock/sqlpp11-connector-sqlite3.git#tag=0.15")
sha256sums=('SKIP')

build() {
    patch sqlpp11-connector-sqlite3/CMakeLists.txt ../cmake_patch
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../sqlpp11-connector-sqlite3
    make
}

#check() {
  #cd $srcdir/build
  #make test
#}

package() {
  cd $srcdir/build
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir"/usr/share/licenses/sqlpp11-connector-sqlite3
  install -Dm644 ../sqlpp11-connector-sqlite3/LICENSE "$pkgdir"/usr/share/licenses/sqlpp11-connector-sqlite3/LICENSE
}
