# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-location-field' 'python2-django-location-field')
pkgdesc="Let users pick locations using a map widget and store its latitude and longitude"
pkgver=2.1.0
pkgrel=1
url="https://github.com/caioariede/django-location-field"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/d/django-location-field/django-location-field-${pkgver}.tar.gz")
sha256sums=('fbde6115814fb0b071b8026d5b0c906efca20a79536110f7dc33d1e505c85106')

build() {
  cp -r ${srcdir}/django-location-field-${pkgver} ${srcdir}/django-location-field-${pkgver}-py2

  cd ${srcdir}/django-location-field-${pkgver}
  python setup.py build

  cd ${srcdir}/django-location-field-${pkgver}-py2
  python2 setup.py build
}

package_python-django-location-field() {
  depends=('python-django')
  cd ${srcdir}/django-location-field-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-django-location-field() {
  depends=('python2-django')
  cd ${srcdir}/django-location-field-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

