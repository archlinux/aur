# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Simon Hanna <simon DOT hanna at serve-me dot info>

_pkgname=django-ical
pkgname=('python-django-ical' 'python2-django-ical')
pkgver=1.7.0
pkgrel=1
pkgdesc="iCal feeds for Django based on Django's syndication feed framework"
arch=('any')
url="https://github.com/jazzband/django-ical"
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/jazzband/django-ical/archive/${pkgver}.tar.gz")
sha256sums=('43e505044624e1660ee1516f457648e81e985e3512f57e49438add41ac407ea5')


prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

check() {
  cd "${_pkgname}-${pkgver}"
  python setup.py test
  cd "${_pkgname}-${pkgver}-py2"
  python2 setup.py test
}

package_python-django-ical() {
  depends=('python-django' 'python-icalendar')
  
  cd "${_pkgname}-${pkgver}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1 --skip-build
}

package_python2-django-ical() {
  depends=('python2-django' 'python2-icalendar')
  
  cd "${_pkgname}-${pkgver}-py2"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1 --skip-build
}
