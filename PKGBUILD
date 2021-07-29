# Maintainer:  Rod Kay <rodakay5 at gmail dot com>
# Contributor: Julian Leyh <julian@vgai.de>

pkgname=ahven
pkgver=2.8
pkgrel=1
pkgdesc="A simple unit test framework for the Ada programming language."

arch=('i686' 'x86_64')
url="http://ahven-framework.com/"
license=('ISC')

depends=('gcc-ada')
makedepends=('sphinxcontrib-adadomain')

source=(https://www.ahven-framework.com/releases/ahven-2.8.tar.gz)
sha256sums=('6ead94fbd1b95454e959cc2a343acfb2f733bcbf10d9a286214d1dec1b9e8e0c')


build() 
{
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr
  make prefix=/usr docs
}


check() 
{
  cd "$srcdir/$pkgname-$pkgver"
  make check
}


package() 
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install

  # Install the license.
  install -D -m644     \
     "LICENSE.txt"     \
     "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}