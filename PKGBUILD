# Contributor: Julian Leyh <julian@vgai.de>
# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=ahven
pkgver=2.6
pkgrel=3
pkgdesc="Ahven is a simple unit test framework for the Ada programming language."

arch=('i686' 'x86_64')
url="http://ahven.stronglytyped.org/"
license=('BSD')

depends=('gcc-ada')
makedepends=('sphinxcontrib-adadomain')


source=(http://www.ahven-framework.com/releases/ahven-2.6.tar.gz
        ahven.gpr
        patch-comfignat.mk)

md5sums=('776d3da3cd30a9c8d7db1f84f55c8381'
         'ea461d9f823370b1bbf509f8230fb26d'
         'c2f87072663a2a77cbbb590ef4eb49b6')


prepare()
{
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i ../patch-comfignat.mk
}


build() 
{
  cd "$srcdir/$pkgname-$pkgver"
  make
}


check() 
{
  cd "$srcdir/$pkgname-$pkgver"
  make check
}


package() 
{
  cd "$srcdir/$pkgname-$pkgver"

  make  DESTDIR=$pkgdir  SPHINXBUILD=sphinx-build2  install

  mkdir -p $pkgdir/usr/lib/gnat
  cp ../ahven.gpr  $pkgdir/usr/lib/gnat
}
