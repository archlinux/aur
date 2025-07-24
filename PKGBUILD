# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=aunit
epoch=1
pkgver=25.0.0
pkgrel=1
pkgdesc="Ada unit testing framework"

arch=(i686 x86_64)
url=https://libre.adacore.com
license=(GPL V3.0)

depends=(gcc-ada)
makedepends=(gprbuild
             python-sphinx_rtd_theme)

source=(https://github.com/AdaCore/aunit/archive/refs/tags/v$pkgver.tar.gz
        aunit.gpr.patch)
sha256sums=(6468914556c95504e9aed1dd81a1fc9969e56416bd3bb25dd3bae3905f35d379
            81b5f79ae62d43fbb1867059ed448dd88b1475d32ab902a0cabd77a11c330b9e)

_pkg_src_dir=$pkgname-$pkgver


prepare()
{
   cd $srcdir/$_pkg_src_dir
   
   patch -Np0 -i $srcdir/aunit.gpr.patch
}


build()
{
   cd $srcdir/$_pkg_src_dir
   
   make
   make -C doc all                 \
        1> build_docs-warnings.log \
        2> build_docs-errors.log
}


package()
{
   cd $srcdir/$_pkg_src_dir
   
   make INSTALL="$pkgdir/usr" install
}