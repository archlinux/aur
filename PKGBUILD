# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=sqlite3pp-git
pkgver=1.0.8+1.g30d38560c7
pkgrel=1
pkgdesc="C++ wrapper of SQLite3 API"
arch=('i686' 'x86_64')
url="https://github.com/iwongu/sqlite3pp"
depends=(boost sqlite3)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "sqlite3pp"
  git describe --tags --long --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cd "sqlite3pp/src"
  cxx='c++ -std=c++11 -fPIC -shared'
  ${cxx} -o libsqlite3pp.so    sqlite3pp.cpp
  ${cxx} -o libsqlite3ppext.so sqlite3ppext.cpp
}

package() {
  cd "sqlite3pp/src"

  # Headers
  install -d "$pkgdir/usr/include/"
  install -Dm644 *.h "$pkgdir/usr/include/"

  # Shared objects
  install -d "$pkgdir/usr/lib/"
  install -Dm644 *.so "$pkgdir/usr/lib/"
}
