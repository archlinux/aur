# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>
pkgname=('python-django-guardian' 'python2-django-guardian')
pkgver=1.2.5
pkgrel=1
pkgdesc="Implementation of per object permissions for Django 1.2 or later"
arch=('any')
url="http://github.com/lukaszb/django-guardian"
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/d/django-guardian/django-guardian-${pkgver}.tar.gz")
md5sums=('be7d9443c72ee32be576480f91ad5200')

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
