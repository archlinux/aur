# $Id$
# Maintainer:
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: simo <simo@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=django
pkgver=1.2.4
pkgrel=1
pkgdesc="A high-level Python Web framework."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
depends=('python2')
makedepends=('setuptools')
optdepends=('mysql-python: for MySQL backend'
            'python-psycopg2: for PostgreSQL backend')
source=("http://media.djangoproject.com/releases/1.2/Django-$pkgver.tar.gz")
md5sums=('b0e67d3d6447f7eb1ce6392b9465a183')
sha256sums=('0f06cccd4ca92173b958dd80edff35035888f15554be425e5d6d55c7f94a8381')

build() {
  cd ${srcdir}/Django-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -Dm644 extras/django_bash_completion \
    ${pkgdir}/etc/bash_completion.d/django

  find $pkgdir/usr/lib/python2.7/site-packages/django/ -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
