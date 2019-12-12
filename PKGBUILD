# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-bootstrap4' 'python2-django-bootstrap4')
_name='django-bootstrap4'
pkgdesc="Bootstrap 4 integration with Django"
pkgver=1.1.0
pkgrel=1
url="https://github.com/zostera/django-bootstrap4"
license=('BSD-3-Clause')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('180edf28d8dcdcee56ca8d7919147c3c98031ecc898c063b228f9855746de80a')

build() {
  cp -r ${srcdir}/django-bootstrap4-${pkgver} ${srcdir}/django-bootstrap4-${pkgver}-py2

  cd ${srcdir}/django-bootstrap4-${pkgver}
  python setup.py build

  cd ${srcdir}/django-bootstrap4-${pkgver}-py2
  python2 setup.py build
}

package_python-django-bootstrap4() {
  depends=('python-django')
  cd ${srcdir}/django-bootstrap4-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-django-bootstrap4() {
  depends=('python2-django')
  cd ${srcdir}/django-bootstrap4-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}



# vim:set ts=2 sw=2 et:

