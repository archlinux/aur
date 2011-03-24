# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=django
pkgver=1.3
pkgrel=1
pkgdesc="A high-level Python Web framework."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
depends=('python2')
makedepends=('setuptools')
optdepends=('mysql-python: for MySQL backend'
            'python2-psycopg2: for PostgreSQL backend')
source=("http://media.djangoproject.com/releases/1.3/Django-$pkgver.tar.gz")
md5sums=('1b8f76e91c27564708649671f329551f')
sha256sums=('7aeee5c80002ab81d4ebf5416292949ff46e1448d183a183fe05ff6344771c83')

build() {
  cd ${srcdir}/Django-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -Dm644 extras/django_bash_completion \
    ${pkgdir}/etc/bash_completion.d/django

  find $pkgdir/usr/lib/python2.7/site-packages/django/ -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
