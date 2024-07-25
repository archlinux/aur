# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-c
# source is shared with python-psycopg package, hence the weird naming
_pkgname=psycopg
pkgver=3.2.1
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
b2sums=('badea79ca48b99ae363ffa1d04de922add9456662e0909a2761f61f1a5d03e2afc01ee188814495029551d9521aff95caa7ef3123d96dfcfbb3c0d0a14597e3c')

build(){
  cd "$_pkgname-$pkgver/psycopg_c"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname-$pkgver/psycopg_c"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
