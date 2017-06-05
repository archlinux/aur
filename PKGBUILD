# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>
# Contributor: Rod Kay            <charlie5 on #ada at freenode.net>

pkgname=gnat-gps
pkgver=2017
pkgrel=1
pkgdesc="GPS, the GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/gps"
license=('GPL')

depends=("clang" "gnatcoll")
makedepends=("libadalang")

source=(git+https://github.com/AdaCore/gps.git
        patch-Makefile.in)

md5sums=('SKIP'
         'SKIP')


prepare()
{
  cd $srcdir/gps

  patch -p0 -i ../patch-Makefile.in
}



build() 
{
  export OS=unix
  export Build=Production
	
  cd $srcdir/gps

  ./configure  --prefix=/usr

  PYTHON=python2 PROCESSORS=5  make -j5
}



package() 
{
  cd $srcdir/gps

  PYTHON=python2 make DESTDIR="$pkgdir/" install
}
