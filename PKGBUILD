# $Id$
# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=python-django2
pkgver=2.0.4
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
sha512sums=('4fa464f160cd33f515aa53d1c47dc4724d983faade9b2c8f399216e53306796716c130ec4d2c5db3d1630248e5a98c9203f4cd45f8837567d4bb76b9b7b4233d')

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
