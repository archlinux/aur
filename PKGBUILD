# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgbase=gnatcoll-bindings
pkgname=(gnatcoll-python2 gnatcoll-readline gnatcoll-iconv  gnatcoll-gmp 
         gnatcoll-lzma    gnatcoll-omp      gnatcoll-syslog gnatcoll-zlib)
_upstream_ver=2021-20210518-19B15
epoch=1
pkgver=21.0.0
pkgrel=6

pkgdesc='GNAT Components Collection - Language and library bindings'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('gnatcoll-core' 'libiconv' 'syslog-ng')
makedepends=('python2' 'gprbuild')

_checksum=d93655ced17f15c5f376b6861825df3f9c183980
source=("${pkgbase}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgbase}-${_upstream_ver}-src.tar.gz")
sha1sums=("$_checksum")

build()
{
    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   _gpr_opts="-R -cargs $ADA_FLAGS -fPIC -largs $LDFLAGS"

    cd "$srcdir/$pkgbase-$_upstream_ver-src/python"
    # --gpr-opts reads all remaining arguments, so no quotes
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$_upstream_ver-src/readline"
    python2 setup.py build --prefix=/usr --accept-gpl --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$_upstream_ver-src/iconv"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$_upstream_ver-src/gmp"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$_upstream_ver-src/lzma"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$_upstream_ver-src/omp"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$_upstream_ver-src/syslog"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$pkgbase-$_upstream_ver-src/zlib"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts
}

_install_license()
{
    cd "$srcdir/$pkgbase-$_upstream_ver-src"

    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}

package_gnatcoll-python2()
{
    pkgdesc='GNAT Components Collection - Interface to the python 2 interpreter.'
    depends=('python2' 'gnatcoll-core')
    provides=('gnatcoll-python')
    replaces=('gnatcoll-python')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/python"

    GNATCOLL_VERSION=2021    \
    LIBRARY_TYPE=relocatable \
    gprinstall -P gnatcoll_python -p --prefix=$pkgdir/usr

    _install_license    
}

package_gnatcoll-readline()
{
    pkgdesc='GNAT Components Collection - Bindings to readline'
    depends=('readline' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/readline"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-iconv()
{
    pkgdesc='GNAT Components Collection - Bindings to Libiconv'
    depends=('libiconv' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/iconv"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-gmp()
{
    pkgdesc='GNAT Components Collection - Bindings to GMP'
    depends=('gmp' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/gmp"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-lzma()
{
    pkgdesc='GNAT Components Collection - Bindings to LZMA'
    depends=('xz' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/lzma"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-omp()
{
    pkgdesc='GNAT Components Collection - Bindings to OpenMP'
    depends=('gnatcoll-core')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/omp"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-syslog()
{
    pkgdesc='GNAT Components Collection - Bindings to the Syslog the system logger on Unix systems.'
    depends=('syslog-ng' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/syslog"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-zlib()
{
    pkgdesc='GNAT Components Collection - Bindings to Zlib.'
    depends=('zlib' 'gnatcoll-core')

    cd "$srcdir/$pkgbase-$_upstream_ver-src/zlib"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}