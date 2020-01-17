# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Jonathan Kotta <jpkotta at gmail dot com>

_name=ipython-sql
pkgbase=python-ipython-sql
pkgname=(python-ipython-sql python2-ipython-sql)
pkgver=0.3.9
pkgrel=1
pkgdesc="Issue SQL commands from IPython."
arch=('any')
url="https://pypi.python.org/pypi/ipython-sql"
license=('custom:PYTHON')
makedepends=('ipython' 'python-sqlalchemy' 'python-prettytable' 'python-sqlparse')
makedepends+=('ipython2' 'python2-sqlalchemy' 'python2-prettytable' 'python2-sqlparse')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('69407492ac7fcb92520e10d24b3b3194')


prepare() {
  cp -a ${_name}-${pkgver}{,-python2}
}

build() {
  cd "${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-ipython-sql() {
  depends=('ipython' 'python-sqlalchemy' 'python-prettytable' 'python-sqlparse')

  cd "${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-ipython-sql() {
  depends=('ipython2' 'python2-sqlalchemy' 'python2-prettytable' 'python2-sqlparse')

  cd "${_name}-${pkgver}-python2"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
