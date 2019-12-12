# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-crontab' 'python2-django-crontab')
pkgdesc="Dead simple crontab powered job scheduling for django"
pkgver=0.7.1
pkgrel=3
url="https://github.com/kraiz/django-crontab"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://github.com/kraiz/django-crontab/archive/${pkgver}.tar.gz")
sha256sums=('71c86470a90ce1f7a27a978b5348f44e41280748e894da631d1ddf402cbe4998')

build() {
  cp -r ${srcdir}/django-crontab-${pkgver} ${srcdir}/django-crontab-${pkgver}-py2

  cd ${srcdir}/django-crontab-${pkgver}
  python setup.py build

  cd ${srcdir}/django-crontab-${pkgver}-py2
  python2 setup.py build
}

package_python-django-crontab() {
  depends=('python-django')
  cd ${srcdir}/django-crontab-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-django-crontab() {
  depends=('python2-django')
  cd ${srcdir}/django-crontab-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

