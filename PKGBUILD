# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-python
pkgver=2020
pkgrel=1

pkgdesc='GNAT Components Collection - interface to the python interpreter.'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('python2' 'gnatcoll-core')
makedepends=('gprbuild')

bindings_src=gnatcoll-bindings-20.0-20191009-1B2EA-src

source=('https://community.download.adacore.com/v1/3c54db553121bf88877e2f56ac4fca36765186eb?filename=$bindings_src.tar.gz'
        'gnatcoll_python.gpr-patch')
        
sha1sums=('3c54db553121bf88877e2f56ac4fca36765186eb'
          '2cdbc553ec055f023f127117e4481266bbfcfe30')

prepare()
{
    cd "$srcdir/$bindings_src/python"
    patch -Np0 -i "$srcdir"/gnatcoll_python.gpr-patch
}


build()
{
    cd "$srcdir/$bindings_src/python"
    python2 setup.py build -j1 --prefix=/usr
}


package()
{
    cd "$srcdir/$bindings_src/python"
    python2 setup.py install --prefix="$pkgdir/usr"
}
