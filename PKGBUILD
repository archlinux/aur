# Maintainer: Stefan Ott <arch at desire dot ch>
# Contributor: Clément Démoulins <clement@archivel.fr>

pkgbase=('tvdb_api')
pkgname=('python-tvdb_api' 'python2-tvdb_api')
pkgver=2.0
pkgrel=2
pkgdesc="easy to use interface to thetvdb.com"
arch=('any')
url="http://github.com/dbr/tvdb_api"
license=('GPL')
conflicts=('tvdb_api')
makedepends=('python-setuptools')

source=(http://github.com/dbr/tvdb_api/tarball/$pkgver)
sha512sums=('77192ea62f5d604694e11f432ea4d0364ecc5aa91ee8157f09df089f8af535b6263bfd99ef5b3e0ac5d970477549e2541b88b3ba121841d51704da3b36a2c09d')

prepare()
{
    cp -ar dbr-tvdb_api-* tvdb_api-py2
}

build()
{
    cd "$srcdir/dbr-tvdb_api-"*
    python setup.py build

    cd "$srcdir/tvdb_api-py2"
    python2 setup.py build
}

package_python2-tvdb_api()
{
    depends=('python2' 'python2-requests' 'python2-requests-cache')

    cd "$srcdir/dbr-tvdb_api-"*
    python2 setup.py install --root="$pkgdir" --optimize=1
    find "$pkgdir" -type f -name '*.py' -exec sed -ri '1 s%\#!/usr/bin/(env python)|(python)%\#!/usr/bin/env python2%' {} \;
}

package_python-tvdb_api()
{
    depends=('python' 'python-requests' 'python-requests-cache')

    cd "$srcdir/dbr-tvdb_api-"*
    python setup.py install --root="$pkgdir" --optimize=1
}
