# Maintainer:  Rod Kay <rodakay5 at gmail dot com>
# Contributor: Julian Leyh <julian@vgai.de>

pkgname=ahven
pkgver=2.9
pkgrel=1
pkgdesc="A simple unit test framework for the Ada programming language."

arch=(i686 x86_64)
url=http://ahven-framework.com
license=(ISC)

depends=(gcc-ada)
makedepends=(sphinxcontrib-adadomain)

source=(https://www.ahven-framework.com/releases/ahven-2.9.tar.gz)
sha256sums=(35187a3833c2fe62710f47e5bde3ee1c32fd964bcedf2ca65c3f324e82a8a1fa)


build()
{
  cd $srcdir/$pkgname-$pkgver
  
  make prefix=/usr
  
  make prefix=/usr docs           \
       1> build_docs-warnings.log \
       2> build_docs-errors.log
}


check() 
{
  cd $srcdir/$pkgname-$pkgver
  
  make check
}


package() 
{
  cd $srcdir/$pkgname-$pkgver
  
  make DESTDIR=$pkgdir install

  # Install the license.
  #
  install -D -m644     \
     "LICENSE.txt"     \
     "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}