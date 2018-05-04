# $Id$
# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=python-django2
pkgver=2.0.5
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
makedepends=('python' 'python-setuptools')
depends=('python' 'python-setuptools' 'python-pytz')
optdepends=('python-psycopg2: for PostgreSQL backend')
provides=('python-django')
conflicts=('python-django')
source=("Django-$pkgver.tar.gz::https://www.djangoproject.com/download/$pkgver/tarball/")
sha256sums=('71d1a584bb4ad2b4f933d07d02c716755c1394feaac1ce61ce37843ac5401092')

build() {
  cd "$srcdir/Django-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Django-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  ln -s django-admin.py "$pkgdir"/usr/bin/django-admin3.py
  ln -s django-admin "$pkgdir"/usr/bin/django-admin3
  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage.py

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
