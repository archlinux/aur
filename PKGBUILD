# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=django
pkgver=1.4.3
pkgrel=1
pkgdesc="A high-level Python Web framework that encourages rapid development and clean design"
arch=('any')
license=('BSD')
url="http://www.djangoproject.com/"
depends=('python2')
makedepends=('python2-distribute')
optdepends=('mysql-python: for MySQL backend'
            'python2-psycopg2: for PostgreSQL backend')
source=("https://www.djangoproject.com/m/releases/1.4/Django-$pkgver.tar.gz")
md5sums=('0b134c44b6dc8eb36822677ef506c9ab')
sha256sums=('dcadb4b612e5d14f62078869617a26a79b3da719573801d351c4a0a7f4181c4e')

build() {
  cd "$srcdir/Django-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/Django-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 extras/django_bash_completion \
    "$pkgdir"/usr/share/bash-completion/completions/django-admin.py
  ln -s django-admin.py \
    "$pkgdir"/usr/share/bash-completion/completions/manage.py

  find "$pkgdir"/usr/lib/python2.7/site-packages/django/ -name '*.py' | \
    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
