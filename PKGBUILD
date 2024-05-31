# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=lal-refactor
pkgdesc='A collection of source code refactoring tools for the Ada.'
pkgver=25.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/lal-refactor

arch=(i686 x86_64)
license=(Apache)

depends=(gcc-ada adasat)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/$pkgname-$pkgver-20240505-16130-src.tar.gz)
sha256sums=(5de03fc76f3765c33a73395cbd510118bd01fc5f5d065277447eebb109d94c57)


build()
{
   cd $srcdir/$pkgname-$pkgver-20240505-16130-src

   export LIBRARY_TYPE=relocatable

   make lib
   make bin
}


package()
{
   cd $srcdir/$pkgname-$pkgver-20240505-16130-src

   PREFIX=$pkgdir/usr \
   make install

   # Install the license.
   #
   install -D -m644 \
      LICENSE.txt   \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}