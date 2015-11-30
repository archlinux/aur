# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-django-crispy-forms' 'python2-django-crispy-forms')
pkgver=1.5.2
pkgrel=1
pkgdesc="Provides DRY django forms"
arch=(any)
url="https://github.com/maraujop/django-crispy-forms"
license=('MIT')
options=(!emptydirs)
source=("https://github.com/maraujop/django-crispy-forms/archive/${pkgver}.tar.gz")
sha256sums=('a790f85b917c93f3895cda6c36716e6ae749104ea9b44871400d94b82f879e0e')

makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-tox')

prepare() {
  cp -a django-crispy-forms-$pkgver{,-py2}
}

build() {
  cd "$srcdir/django-crispy-forms-$pkgver"
  python setup.py build

  cd "$srcdir/django-crispy-forms-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/django-crispy-forms-$pkgver"
  tox -e py35-django18

  cd "$srcdir/django-crispy-forms-$pkgver-py2"
  tox -e py27-django18
}

package_python-django-crispy-forms() {
  depends=('python-django')
  cd "$srcdir/django-crispy-forms-$pkgver"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-crispy-forms() {
  depends=('python2-django')
  cd "$srcdir/django-crispy-forms-$pkgver"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
