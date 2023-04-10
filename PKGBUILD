# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-testing.postgresql
pkgver=1.3.0
pkgrel=9
pkgdesc='Helpers for using temporary PostgreSQL databases in tests'
arch=(any)
url='https://github.com/tk0miya/testing.postgresql'
license=(Apache)
makedepends=(python-setuptools)
depends=(python-testing.common.database python-pg8000 postgresql)
checkdepends=(python-nose python-psycopg2 python-sqlalchemy)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/tk0miya/testing.postgresql/archive/$pkgver.tar.gz"
        https://github.com/tk0miya/testing.postgresql/commit/738c8eb19a4b064dd74ff851c379dd1cbf11bc65.patch)
sha256sums=('a8b41501f92103e2da0990ae72962375f6f1d092b0ac7e97a92f17ab8683bc20'
            '3fac5ec62af8ec6a1a15c3e8f7c71597de4bd3e9496d632bbdd6ce0d9b8da56e')

prepare() {
  cd testing.postgresql-$pkgver

  # fix tests
  patch -Np1 -i ../738c8eb19a4b064dd74ff851c379dd1cbf11bc65.patch
}

build() {
  cd testing.postgresql-$pkgver
  python setup.py build
}

check() {
  cd testing.postgresql-$pkgver
  nosetests -v
}

package() {
  cd testing.postgresql-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
