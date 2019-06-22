# Maintainer:  Rod Kay               <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat@kawie.fr>

pkgname=gnat_util
pkgver=2019
pkgrel=1
pkgdesc="Internal GNAT compiler components used by (at least) ASIS."

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0 without any Runtime Exception')

depends=('gcc-ada')
makedepends=('gprbuild')

source=('http://mirrors.cdn.adacore.com/art/5cdf8e5031e87a8f1d425090'
        'ali.adb-patch')
sha1sums=('ccd37abcc9fbbe89b782dbe789b77278cb1d3789'
          '2a29832fec08f4f94ddf79b61ed7d40a87a3f8ed')

_pkg_src_dir="gnat_util-2019-20190517-194CA-src"


prepare()
{
  cd "$srcdir/$_pkg_src_dir"
  patch -Np0 -i "$srcdir/ali.adb-patch"
}


build()
{
  cd "$srcdir/$_pkg_src_dir"
  make 'ENABLE_SHARED=yes'
}


package()
{
  cd "$srcdir/$_pkg_src_dir"
  make 'ENABLE_SHARED=yes' prefix="$pkgdir/usr" install
}
