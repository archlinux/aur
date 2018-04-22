# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-markupfield' 'python2-django-markupfield')
pkgdesc="An implementation of a custom MarkupField for Django"
pkgver=1.4.3
pkgrel=1
url="https://github.com/jamesturk/django-markupfield"
license=('BSD')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://github.com/jamesturk/django-markupfield/archive/${pkgver}.tar.gz")
sha256sums=('2c5a88f5ec4837a602ef3390a9713a23117e9120072475b5254fbe9273e8c046')

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

