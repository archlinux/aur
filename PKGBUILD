pkgname=python2-bsddb
_pkgname=bsddb3
pkgver=6.2.9
pkgrel=2
pkgdesc='Python interface for BerkeleyDB'
arch=('x86_64')
url='https://www.jcea.es/programacion/pybsddb.htm'
license=('BSD')
depends=('db5.3' 'python2')
source=(https://files.pythonhosted.org/packages/source/b/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('70d05ec8dc568f42e70fc919a442e0daadc2a905a1cfb7ca77f549d49d6e7801')

prepare() {
  cd $_pkgname-$pkgver
  # Fix shebangs to use python2
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' Lib/bsddb/{dbshelve,test/test_dbtables}.py
}

build() {
  cd $_pkgname-$pkgver
  BERKELEYDB_INCDIR="/usr/include/db5.3" BERKELEYDB_LIBDIR="/usr/lib/db5.3" python2 setup.py --berkeley-db=/usr build
}

package() {
  cd $_pkgname-$pkgver
  BERKELEYDB_INCDIR="/usr/include/db5.3" BERKELEYDB_LIBDIR="/usr/lib/db5.3" python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
