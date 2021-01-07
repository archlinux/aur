# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-pytzwhere' 'python2-pytzwhere')
pkgdesc="Python library to lookup the timezone for a given lat/lng entirely offline"
pkgver=3.0.3
pkgrel=3
url="https://github.com/pegler/pytzwhere/"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/t/tzwhere/tzwhere-${pkgver}.tar.gz")
sha256sums=('b9a056e60f6ad5d44e7bc9d397ae683ea4bcd81f812ab6bbdfaad3d9984fcf19')

build() {
  cp -r ${srcdir}/tzwhere-${pkgver} ${srcdir}/tzwhere-${pkgver}-py2

  cd ${srcdir}/tzwhere-${pkgver}
  python setup.py build

  cd ${srcdir}/tzwhere-${pkgver}-py2
  python2 setup.py build
}

package_python-pytzwhere() {
  depends=('python-shapely')
  cd ${srcdir}/tzwhere-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-pytzwhere() {
  depends=('python2-shapely')
  cd ${srcdir}/tzwhere-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}



# vim:set ts=2 sw=2 et:

