# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
_pkgname=psycopg
pkgver=3.0.11
pkgrel=1
pkgdesc="A modern implementation of a PostgreSQL adapter for Python"
arch=('x86_64')
url="https://www.psycopg.org/psycopg3/"
license=('LGPL-3')
depends=('python')
optdepends=()
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("psycopg-$pkgver.tar.gz::https://github.com/psycopg/psycopg/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dfb45ddde1b0a3139d3afb28d75fda6f47b63f74bd076143c573921887a581c6')

build(){
  cd "$_pkgname-$pkgver"
  for subpackage in psycopg psycopg_c
  do
    python "$subpackage/setup.py" build
  done
}

package(){
  cd "$_pkgname-$pkgver"
  for subpackage in psycopg psycopg_c
  do
    python "$subpackage/setup.py" install --root="$pkgdir/" --optimize=1 --skip-build
  done
}


#check(){
  #cd "$_pkgname-$pkgver"
  #pytest tests
#}
## vim:ts=2:sw=2:et:
