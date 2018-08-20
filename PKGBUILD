# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-extra-views' 'python2-django-extra-views')
pkgdesc="The missing class-based generic views for Django"
pkgver=0.11.0
pkgrel=1
url="https://github.com/AndrewIngram/django-extra-views"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://github.com/AndrewIngram/django-extra-views/archive/${pkgver}.tar.gz")
sha256sums=('c34bc17d316e8ae32771453b4f11f2be19aa921148c1cd764e4e9a926ab59fd3')

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

