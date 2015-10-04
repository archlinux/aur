# Maintainer: willemw <willemw12@gmail.com>
# Based on "community/python-sqlalchemy" package ($Id: PKGBUILD 142594 2015-10-01 16:09:45Z fyan $)


##pkgbase=python-sqlalchemy-0.7
#pkgname=('python-sqlalchemy-0.7' 'python2-sqlalchemy-0.7')
#pkgver=0.7.10
#source=("https://pypi.python.org/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz"{,.asc})
#md5sums=('ecc0cd1cd906d17818a5f08fe13ae19e'
#         'SKIP')


#pkgbase=python-sqlalchemy-0.7.9
pkgname=('python-sqlalchemy-0.7.9' 'python2-sqlalchemy-0.7.9')
pkgver=0.7.9
pkgrel=5
arch=('i686' 'x86_64') # python2 package contain .so
url="http://www.sqlalchemy.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
#checkdepends=('python-pytest' 'python2-pytest' 'python-mock' 'python2-mock')
source=("https://pypi.python.org/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz")
md5sums=('a0b58defc5ad0c7e1baeb932f62d08dd')

prepare() {
  rm -rf SQLAlchemy2-$pkgver
  cp -a SQLAlchemy-$pkgver SQLAlchemy2-$pkgver
}

build() {
  cd SQLAlchemy-$pkgver
  python setup.py build

  cd ../SQLAlchemy2-$pkgver
  python2 setup.py build
}

#check() {
#  cd SQLAlchemy-${pkgver}
#  PYTHONPATH="$(pwd)/build/lib.linux-$CARCH-3.5:$PYTHONPATH" py.test
# 
#  cd ../SQLAlchemy2-$pkgver  
#  PYTHONPATH="$(pwd)/build/lib.linux-$CARCH-2.7:$PYTHONPATH" py.test2
#}

package_python-sqlalchemy-0.7.9() {
  pkgdesc='Python SQL toolkit and Object Relational Mapper'
  depends=('python')
  optdepends=('python-psycopg2: connect to PostgreSQL database')
  conflicts=('python-sqlalchemy')
  provides=("python-sqlalchemy=$pkgver")

  cd SQLAlchemy-${pkgver}
  python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-sqlalchemy-0.7.9() {
  pkgdesc='Python 2 SQL toolkit and Object Relational Mapper'
  depends=('python2')
  optdepends=('python2-psycopg2: connect to PostgreSQL database')
  conflicts=('python2-sqlalchemy')
  provides=("python2-sqlalchemy=$pkgver")

  cd SQLAlchemy2-$pkgver
  python2 setup.py install --root="$pkgdir"
  install -D -m644 LICENSE \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
