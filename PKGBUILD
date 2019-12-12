# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-extra-views' 'python2-django-extra-views')
pkgdesc="The missing class-based generic views for Django"
pkgver=0.12.0
pkgrel=2
url="https://github.com/AndrewIngram/django-extra-views"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://github.com/AndrewIngram/django-extra-views/archive/${pkgver}.tar.gz")
sha256sums=('d1a513c70b94abc7b97c0a109401e53bcff9fd303e4a807d4b7aaebce1350ed7')

build() {
  cp -r ${srcdir}/django-extra-views-${pkgver} ${srcdir}/django-extra-views-${pkgver}-py2

  cd ${srcdir}/django-extra-views-${pkgver}
  python setup.py build

  cd ${srcdir}/django-extra-views-${pkgver}-py2
  python2 setup.py build
}

package_python-django-extra-views() {
  depends=('python-django')
  cd ${srcdir}/django-extra-views-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-django-extra-views() {
  depends=('python2-django')
  cd ${srcdir}/django-extra-views-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

