# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-polymorphic' 'python2-django-polymorphic')
pkgdesc="Polymorphic Models for Django"
pkgver=2.0.2
pkgrel=2
url="https://github.com/django-polymorphic/django-polymorphic"
license=('BSD')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://github.com/django-polymorphic/django-polymorphic/archive/v${pkgver}.tar.gz")
sha256sums=('48b7b4612dbb93a1f933da3f78caf233e838eff42fb2dd53d71d17640a2d684a')

build() {
  cp -r ${srcdir}/django-polymorphic-${pkgver} ${srcdir}/django-polymorphic-${pkgver}-py2

  cd ${srcdir}/django-polymorphic-${pkgver}
  python setup.py build

  cd ${srcdir}/django-polymorphic-${pkgver}-py2
  python2 setup.py build
}

package_python-django-polymorphic() {
  depends=('python-django')
  cd ${srcdir}/django-polymorphic-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-django-polymorphic() {
  depends=('python2-django')
  cd ${srcdir}/django-polymorphic-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

