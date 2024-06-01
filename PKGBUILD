# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=aunit
epoch=1
pkgver=24.0.0
pkgrel=1
pkgdesc="Ada unit testing framework"

arch=(i686 x86_64)
url=https://libre.adacore.com
license=(GPL V3.0)

depends=(gcc-ada)
makedepends=(gprbuild
             python-sphinx_rtd_theme)

source=(https://github.com/AdaCore/aunit/archive/refs/tags/v$pkgver.tar.gz
        conf.py.patch
        aunit.gpr.patch)
sha256sums=(37ff479034a56b79fd1ca37aa699ca43f03116aae8337214f8e415a41a9155f3
            2b4ac6344f6b66d3dcce0e6cf91accb85de17fc2bcee0bbea50679f36db5a884
            81b5f79ae62d43fbb1867059ed448dd88b1475d32ab902a0cabd77a11c330b9e)

_pkg_src_dir=$pkgname-$pkgver


prepare()
{
   cd $srcdir/$_pkg_src_dir
   
   patch -Np0 -i $srcdir/conf.py.patch
   patch -Np0 -i $srcdir/aunit.gpr.patch
}


build()
{
   cd $srcdir/$_pkg_src_dir
   make
   
   cd doc
   make html-all
}


package()
{
   cd $srcdir/$_pkg_src_dir
   make INSTALL="$pkgdir/usr" install
}