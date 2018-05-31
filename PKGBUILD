# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>

pkgbase=python2-htsql
pkgname=('python-htsql' 'python2-htsql')
_pkgname=HTSQL
pkgver=2.3.3
pkgrel=1
pkgdesc="A comprehensive navigational query language for relational databases."
arch=('any')
url="http://htsql.org"
license=('GPL')
makedepends=('python' 'python-setuptools' 'python-pyaml'
             'python2' 'python2-setuptools' 'python2-pyaml')
source=("http://dist.htsql.org/source/${_pkgname}-${pkgver}.tar.gz")
md5sums=('34fabf3f4dbc578abba27540491185de')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

package_python-htsql() {
  depends=('python' 'python-setuptools' 'python-pyaml')
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-htsql() {
  depends=('python2' 'python2-setuptools' 'python2-pyaml')
  cd ${_pkgname}-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
