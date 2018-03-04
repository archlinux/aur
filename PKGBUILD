# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-pytzwhere' 'python2-pytzwhere')
pkgdesc="Python library to lookup the timezone for a given lat/lng entirely offline"
pkgver=2.3.1
pkgrel=1
url="https://github.com/pegler/pytzwhere/"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://github.com/pegler/pytzwhere/archive/${pkgver}.tar.gz")
sha256sums=('84a838d0e4d30f49016c6bf354b3975c76ee1653affc38f1ab9beaafd1c454b8')

build() {
  cp -r ${srcdir}/pytzwhere-${pkgver} ${srcdir}/pytzwhere-${pkgver}-py2

  cd ${srcdir}/pytzwhere-${pkgver}
  python setup.py build

  cd ${srcdir}/pytzwhere-${pkgver}-py2
  python2 setup.py build
}

package_python-pytzwhere() {
  depends=('python-shapely')
  cd ${srcdir}/pytzwhere-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-pytzwhere() {
  depends=('python2-shapely')
  cd ${srcdir}/pytzwhere-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}



# vim:set ts=2 sw=2 et:

