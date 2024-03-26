# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-c
# source is shared with python-psycopg package, hence the weird naming
_pkgname=psycopg
pkgver=3.1.18
pkgrel=1
pkgdesc='psycopg C extension'
arch=('x86_64')
url='https://www.psycopg.org/psycopg3/'
license=('LGPL-3.0-only')
depends=('postgresql-libs' 'python' 'python-psycopg')
makedepends=(
  'cython'
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$_pkgname.tar.gz::https://github.com/psycopg/psycopg/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('35e5e4cb4e5355189b387fd17e1b51d4baf08f130cc5418f9f3cb58d6baf097953b4f6a7df31579a1d87e5269e110c4476d865fe12416e2fe62abbb52e0c141c')

build(){
  cd "$_pkgname-$pkgver/psycopg_c"

  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname-$pkgver/psycopg_c"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
