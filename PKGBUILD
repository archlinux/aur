# Maintainer: Simon Hanna <simon DOT hanna at serve-me dot info>
pkgname=('python-django-ical' 'python2-django-ical')
pkgver=1.3
pkgrel=1
pkgdesc="a simple library/framework for creating ical feeds based in Django's syndication feed framework"
arch=('any')
url="https://bitbucket.org/IanLewis/django-ical"
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/d/django-ical/django-ical-${pkgver}.tar.gz"
        'tests.patch' 'views.patch' 
)
sha256sums=('9a002aa3dcb3c7a4fc1c6c81bae8906bb89e78b429f43108ff82f76080386740'
            'c6dd20758035581e829233000dd5263e2062fa8c1e43d98169412bbec92fc067'
            'a043092bcf3ec90fc8af8ad36865614c38636d5ebf36deb6ee3e4ddb91691134')
build() {
  cp -r ${srcdir}/django-ical-${pkgver} ${srcdir}/django-ical-${pkgver}-py2

  cd ${srcdir}/django-ical-${pkgver}
  cd django_ical
  patch < ${srcdir}/views.patch
  patch < ${srcdir}/tests.patch
  cd ..
  python setup.py build

  cd ${srcdir}/django-ical-${pkgver}-py2
  python2 setup.py build
}

package_python-django-ical() {
  depends=('python-django>=1.4.2' 'python-icalendar')
  cd ${srcdir}/django-ical-${pkgver}
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --prefix=/usr --root=${pkgdir}
}

package_python2-django-ical() {
  depends=('python2-django' 'python2-icalendar')
  cd ${srcdir}/django-ical-${pkgver}-py2
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
