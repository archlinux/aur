# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-python
pkgver=2018
pkgrel=1

pkgdesc='GNAT Components Collection - interface to the python interpreter.'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'python2' 'gnatcoll-core')
makedepends=('gprbuild')

provides=('gnatcoll-python')
conflicts=('gnatcoll-python')

source=('http://mirrors.cdn.adacore.com/art/5b0ce9cfc7a4475261f97ca5'
        'setup.py-patch')
sha1sums=('42682c885e4a02bb03786aa9ece3a4214ca419f8'
          '92d80368c81b0e9eef3f9ab7e0fcc5da61b532e9')


prepare()
{
    cd "$srcdir/gnatcoll-bindings-gpl-2018-src/python"
    patch -Np0 -i "$srcdir"/setup.py-patch
}

build()
{
    cd "$srcdir/gnatcoll-bindings-gpl-2018-src/python"
    python2 setup.py build -j$(nproc) --prefix=/usr -R
}

package()
{
    cd "$srcdir/gnatcoll-bindings-gpl-2018-src/python"
    python2 setup.py install --prefix="$pkgdir/usr"
}
