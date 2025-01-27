# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-c
# source is shared with python-psycopg package, hence the weird naming
_pkgname=psycopg
pkgver=3.2.3
pkgrel=2
pkgdesc='psycopg C extension'
arch=('x86_64')
url='https://www.psycopg.org/psycopg3/'
license=('LGPL-3.0-only')
depends=('postgresql-libs' 'python' 'python-psycopg')
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/psycopg/psycopg/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('1f748fc2dc915fd82b2bc557ae4263ecf1070d5ba08681cb6ae21570acf601b03a2bde7e4324cd506e0146c86db976b003c57e99cd1948a930c074f0674d6ba8')

build(){
  cd "$_pkgname-$pkgver/psycopg_c"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname-$pkgver/psycopg_c"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
