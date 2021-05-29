# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgbase=gnatcoll-bindings
pkgname=(gnatcoll-python2 gnatcoll-readline gnatcoll-iconv gnatcoll-gmp)
epoch=1
pkgver=21.0.0
pkgrel=2

pkgdesc='GNAT Components Collection - Language and library bindings'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

makedepends=('python2' 'readline' 'libiconv' 'gmp' 'gprbuild' 'gnatcoll-core')

source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('53965f54647ea9c8b59856c7a00079ff5d5a473f549f2d4c9a517dffc6ee7c8f')

build()
{
    _gpr_opts="-R -cargs $CFLAGS -largs $LDFLAGS"

    cd "$srcdir/$pkgbase-$pkgver/python"
    # --gpr-opts reads all remaining arguments, so no quotes
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$pkgver/readline"
    python2 setup.py build --prefix=/usr --accept-gpl --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$pkgver/iconv"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$pkgver/gmp"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts
}

package_gnatcoll-python2()
{
    pkgdesc='GNAT Components Collection - Interface to the python 2 interpreter.'
    depends=('python2' 'gnatcoll-core')
    provides=('gnatcoll-python')
    replaces=('gnatcoll-python')

    cd "$srcdir/$pkgbase-$pkgver/python"
    python2 setup.py install --prefix="$pkgdir/usr"
}

package_gnatcoll-readline()
{
    pkgdesc='GNAT Components Collection - Bindings to readline'
    depends=('readline' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$pkgver/readline"
    python2 setup.py install --prefix="$pkgdir/usr"
}

package_gnatcoll-iconv()
{
    pkgdesc='GNAT Components Collection - Bindings to Libiconv'
    depends=('libiconv' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$pkgver/iconv"
    python2 setup.py install --prefix="$pkgdir/usr"
}

package_gnatcoll-gmp()
{
    pkgdesc='GNAT Components Collection - Bindings to GMP'
    depends=('gmp' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$pkgver/gmp"
    python2 setup.py install --prefix="$pkgdir/usr"
}
