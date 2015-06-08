# Maintainer: Francesco Colista <francesco.colista@gmail.com>
# Contributor: Francesco Colista <francesco.colista@gmail.com>

pkgname=luasql-odbc
pkgver=2.3.0
pkgrel=0
pkgdesc='ODBC module for Lua'
arch=('i686' 'x86_64')
url='http://www.keplerproject.org/luasql/'
license=('MIT/X11')
depends=('lua' 'unixodbc')
source=("https://github.com/keplerproject/luasql/archive/v${pkgver}.zip")
md5sums=('dae8388c549b5fccbd16ecc2d49b8f3d')

build() {
  cd $srcdir/luasql-$pkgver
  make T=odbc PREFIX=/usr DRIVER_LIBS=-lodbc DRIVER_INCS=-DUNIXODBC -I/usr/include
}

package() {
  cd $srcdir/luasql-$pkgver
  install -Dm0644 src/odbc.so $pkgdir/usr/lib/lua/5.1/luasql/odbc.so
  install -Dm0644 doc/us/license.html \
    $pkgdir/usr/share/licenses/$pkgname/license.html
}
