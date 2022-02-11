# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgbase=gnatcoll-bindings
pkgname=(gnatcoll-python2 gnatcoll-readline gnatcoll-iconv  gnatcoll-gmp 
         gnatcoll-lzma    gnatcoll-omp      gnatcoll-syslog gnatcoll-zlib)
epoch=1
pkgver=22.0.0
pkgrel=1

pkgdesc='GNAT Components Collection - Language and library bindings'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

makedepends=('python2' 'gprbuild' 'gnatcoll-core' 'libiconv' 'syslog-ng')

source=("https://github.com/AdaCore/gnatcoll-bindings/archive/refs/tags/v22.0.0.tar.gz")
sha1sums=("d1d3b80331dd097bb4e07289d53cd33fad247794")

_source_dir="gnatcoll-bindings-22.0.0"


build()
{
    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   _gpr_opts="-R -cargs $ADA_FLAGS -fPIC -largs $LDFLAGS"

    cd "$srcdir/$_source_dir/python"
    # --gpr-opts reads all remaining arguments, so no quotes
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/readline"
    python2 setup.py build --prefix=/usr --accept-gpl --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/iconv"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/gmp"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/lzma"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/omp"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/syslog"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts

    cd "$srcdir/$_source_dir/zlib"
    python2 setup.py build --prefix=/usr --gpr-opts $_gpr_opts
}

_install_license()
{
    cd "$srcdir/$_source_dir"

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

    cd "$srcdir/$_source_dir/python"

    GNATCOLL_VERSION=0.0     \
    LIBRARY_TYPE=relocatable \
    gprinstall -P gnatcoll_python -p --prefix=$pkgdir/usr

    _install_license    
}

package_gnatcoll-readline()
{
    pkgdesc='GNAT Components Collection - Bindings to readline'
    depends=('readline' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/readline"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-iconv()
{
    pkgdesc='GNAT Components Collection - Bindings to Libiconv'
    depends=('libiconv' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/iconv"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-gmp()
{
    pkgdesc='GNAT Components Collection - Bindings to GMP'
    depends=('gmp' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/gmp"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-lzma()
{
    pkgdesc='GNAT Components Collection - Bindings to LZMA'
    depends=('xz' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/lzma"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-omp()
{
    pkgdesc='GNAT Components Collection - Bindings to OpenMP'
    depends=('gnatcoll-core')

    cd "$srcdir/$_source_dir/omp"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-syslog()
{
    pkgdesc='GNAT Components Collection - Bindings to the Syslog the system logger on Unix systems.'
    depends=('syslog-ng' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/syslog"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}

package_gnatcoll-zlib()
{
    pkgdesc='GNAT Components Collection - Bindings to Zlib.'
    depends=('zlib' 'gnatcoll-core')

    cd "$srcdir/$_source_dir/zlib"
    python2 setup.py install --prefix="$pkgdir/usr"

    _install_license    
}
