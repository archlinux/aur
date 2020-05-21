# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgbase=gnatcoll-bindings
pkgname=(gnatcoll-python2 gnatcoll-readline gnatcoll-iconv gnatcoll-gmp)
_upstream_ver=20.0-20191009-1B2EA
pkgver=2020
pkgrel=3

pkgdesc='GNAT Components Collection - Language and library bindings'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

makedepends=('python2' 'gprbuild' 'gnatcoll-core')

_checksum=3c54db553121bf88877e2f56ac4fca36765186eb
source=("${pkgbase}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgbase}-${_upstream_ver}-src.tar.gz")
sha1sums=("$_checksum")

build()
{
    _gpr_opts="-R -cargs $CFLAGS -largs $LDFLAGS"

    cd "$srcdir/$pkgbase-$_upstream_ver-src/python"
    # --gpr-opts reads all remaining arguments, so no quotes
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$_upstream_ver-src/readline"
    python2 setup.py build --prefix=/usr --accept-gpl --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$_upstream_ver-src/iconv"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$_upstream_ver-src/gmp"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts
}

package_gnatcoll-python2()
{
    pkgdesc='GNAT Components Collection - Interface to the python 2 interpreter.'
    depends=('python2' 'gnatcoll-core')
    provides=('gnatcoll-python')
    replaces=('gnatcoll-python')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/python"
    python2 setup.py install --prefix="$pkgdir/usr"
}

package_gnatcoll-readline()
{
    pkgdesc='GNAT Components Collection - Bindings to readline'
    depends=('readline' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/readline"
    python2 setup.py install --prefix="$pkgdir/usr"
}

package_gnatcoll-iconv()
{
    pkgdesc='GNAT Components Collection - Bindings to Libiconv'
    depends=('libiconv' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/iconv"
    python2 setup.py install --prefix="$pkgdir/usr"
}

package_gnatcoll-gmp()
{
    pkgdesc='GNAT Components Collection - Bindings to GMP'
    depends=('gmp' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/gmp"
    python2 setup.py install --prefix="$pkgdir/usr"
}
