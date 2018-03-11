# $Id$
# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgbase=python-django2
pkgname=python-django2
pkgver=2.0.3
pkgrel=2
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
sha256sums=('769f212ffd5762f72c764fa648fca3b7f7dd4ec27407198b68e7c4abf4609fd0')
sha512sums=('75272abe88ffc5f0beb15222cab499d93605838b5bf0a5f0de461209825b8a61f9aff1105366aa5a036a2b7790b53962706ff27505f400ffc8bda2bccda64446')

build() {
  cd "$srcdir/Django-$pkgver"
  python setup.py build
}

package_python-django2() {
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
