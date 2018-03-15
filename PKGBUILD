# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgbase=python-django-q
pkgname=('python-django-q' 'python2-django-q')
pkgver=0.9.4
pkgrel=1
pkgdesc='A multiprocessing distributed task queue for Django'
arch=('any')
url='https://github.com/Koed00/django-q'
license=('MIT')
makedepends=('python2-django' 'python2-setuptools' 'python2-six'
             'python-django' 'python-setuptools' 'python-six')
source=("django-q-${pkgver}.tar.gz::https://github.com/Koed00/django-q/archive/v${pkgver}.tar.gz")
sha256sums=('f920453fdab30da4da8bb27bfdd97d9aa3a7088925fa5d6324a001b377e4910a')

prepare() {
  cp -r {,python-}django-q-${pkgver}
  mv {,python2-}django-q-${pkgver}
}

build() {
  for py in python{,2}; do
    pushd ${py}-django-q-${pkgver}
    ${py} setup.py build
    popd
  done
}

package_python-django-q() {
  depends=('python-arrow' 'python-blessed' 'python-django'
           'python-django-picklefield' 'python-future' 'python-six')

  cd python-django-q-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize='1' --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-django-q
}

package_python2-django-q() {
  depends=('python2-arrow' 'python2-blessed' 'python2-django'
           'python2-django-picklefield' 'python2-future' 'python2-six')

  cd python-django-q-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize='1' --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python2-django-q
}

# vim: ts=2 sw=2 et:

