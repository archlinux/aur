# Maintainer: Miguel de Val-Borro <valborro at princeton dot edu>
pkgname=('python-django-guardian' 'python2-django-guardian')
pkgver=1.3.2
pkgrel=1
pkgdesc="Implementation of per object permissions for Django 1.2 or later"
arch=('any')
url="http://github.com/lukaszb/django-guardian"
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/d/django-guardian/django-guardian-${pkgver}.tar.gz")
md5sums=('53589b9f1943db0e53a12808eb124c67')

build() {
  cp -r ${srcdir}/django-guardian-${pkgver} ${srcdir}/django-guardian-${pkgver}-py2

  cd ${srcdir}/django-guardian-${pkgver}
  python setup.py build

  cd ${srcdir}/django-guardian-${pkgver}-py2
  python2 setup.py build
}

package_python-django-guardian() {
  depends=('python-django')
  cd ${srcdir}/django-guardian-${pkgver}
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --prefix=/usr --root=${pkgdir}
}

package_python2-django-guardian() {
  depends=('python2-django')
  cd ${srcdir}/django-guardian-${pkgver}-py2
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
