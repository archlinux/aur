# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=django12
pkgver=1.2.7
pkgrel=2
pkgdesc="A high-level Python Web framework."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
depends=('python2')
makedepends=('python2-distribute')
optdepends=('mysql-python: for MySQL backend'
            'python2-psycopg2: for PostgreSQL backend')
provides=("django=${pkgver}")
conflicts=("django")
source=("http://www.djangoproject.com/m/releases/1.2/Django-${pkgver}.tar.gz")
md5sums=('902fe294a2f7b16e5e1dee42d458c2ba')

build() {
  cd "${srcdir}/Django-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/Django-${pkgver}"
  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm644 extras/django_bash_completion \
    "${pkgdir}/etc/bash_completion.d/django"
  find "${pkgdir}/usr/lib/python2.7/site-packages/django" -type f \
    -name '*.py' | xargs sed -i \
    "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
