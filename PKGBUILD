# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgbase=gnatcoll-bindings
pkgname=(gnatcoll-python2 gnatcoll-readline gnatcoll-iconv  gnatcoll-gmp 
         gnatcoll-lzma    gnatcoll-omp      gnatcoll-syslog gnatcoll-zlib)
epoch=1
pkgver=21.0.0
pkgrel=3

pkgdesc='GNAT Components Collection - Language and library bindings'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

makedepends=('python2' 'gprbuild' 'gnatcoll-core' 'libiconv' 'syslog-ng')

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

    cd "$srcdir/$pkgbase-$pkgver/lzma"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$pkgver/omp"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$pkgver/syslog"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$pkgver/zlib"
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

package_gnatcoll-lzma()
{
    pkgdesc='GNAT Components Collection - Bindings to LZMA'
    depends=('xz' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$pkgver/lzma"
    python2 setup.py install --prefix="$pkgdir/usr"
}

package_gnatcoll-omp()
{
    pkgdesc='GNAT Components Collection - Bindings to OpenMP'
    depends=('gnatcoll-core')

    cd "$srcdir/$pkgbase-$pkgver/omp"
    python2 setup.py install --prefix="$pkgdir/usr"
}

package_gnatcoll-syslog()
{
    pkgdesc='GNAT Components Collection - Bindings to the Syslog the system logger on Unix systems.'
    depends=('syslog-ng' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$pkgver/syslog"
    python2 setup.py install --prefix="$pkgdir/usr"
}

package_gnatcoll-zlib()
{
    pkgdesc='GNAT Components Collection - Bindings to Zlib.'
    depends=('zlib' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$pkgver/zlib"
    python2 setup.py install --prefix="$pkgdir/usr"
}
