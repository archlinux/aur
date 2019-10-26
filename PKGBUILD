# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgbase=python-ibm-db-sa
pkgname=(python-ibm-db-sa python2-ibm-db-sa)
pkgver=0.3.3
pkgrel=3
pkgdesc="SQLAlchemy support for IBM Data Servers"
url="https://pypi.python.org/pypi/ibm_db_sa"
license=('Apache')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools' 'python-sqlalchemy' 'python2-sqlalchemy')
checkdepends=('python-nose' 'python2-nose')
source=("https://pypi.io/packages/source/i/ibm_db_sa/ibm_db_sa-$pkgver.tar.gz")
sha512sums=('4b446235c4e43f9322efc4673af53aa70bc3177e72b401a26aaebd12f71db8c188bcbca6eac69c0bf1523cc0805210393ead89990d537d478a679f33d24e7587')

prepare() {
  cp -a ibm_db_sa{,-py2}
}

build() {
  cd "$srcdir"/ibm_db_sa
  python setup.py build

  cd "$srcdir"/ibm_db_sa-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/ibm_db_sa
  nosetests3 || warning "Tests failed"

  cd "$srcdir"/ibm_db_sa-py2
  nosetests2 || warning "Tests failed"
}

package_python-ibm-db-sa() {
  depends=('python-sqlalchemy')

  cd ibm_db_sa
  python3 setup.py install --root="$pkgdir" --optimize=1
}

package_python2-ibm-db-sa() {
  depends=('python2-sqlalchemy')

  cd ibm_db_sa-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
