# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-markupfield' 'python2-django-markupfield')
pkgdesc="An implementation of a custom MarkupField for Django"
pkgver=2.0.1
pkgrel=1
url="https://github.com/jamesturk/django-markupfield"
license=('BSD')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://github.com/jamesturk/django-markupfield/archive/${pkgver}.tar.gz")
sha256sums=('57cf7f3825261eeda2c709494103f05f95c13d2dca9aaf039534848f399bf71f')

build() {
  cp -r ${srcdir}/django-markupfield-${pkgver} ${srcdir}/django-markupfield-${pkgver}-py2

  cd ${srcdir}/django-markupfield-${pkgver}
  python setup.py build

  cd ${srcdir}/django-markupfield-${pkgver}-py2
  python2 setup.py build
}

package_python-django-markupfield() {
  depends=('python-django')
  cd ${srcdir}/django-markupfield-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-django-markupfield() {
  depends=('python2-django')
  cd ${srcdir}/django-markupfield-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

