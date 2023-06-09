# Maintainer: Rod Kay <rodakay5 at gmail dot com>

epoch=1

pkgname=ada_spawn
pkgver=24.0w
pkgrel=1

pkgdesc='A simple Ada API to start processes and communicate with them.'
url=https://github.com/AdaCore/spawn

arch=(i686 x86_64)
license=(Apache)

depends=(gtkada)
makedepends=(gprbuild)

source=(file:///opt/gnatstudio-sources/spawn-$pkgver-20230428-162D4-src.tar.gz)
sha256sums=(11aaea8688f5b4f9e38cf38963b0a0eec553c16f1a21961a071be40f5dd12b39)


build()
{
   cd $srcdir/spawn-$pkgver-20230428-162D4-src

   make all
   
   LIBRARY_TYPE=relocatable \
   gprbuild -P gnat/spawn_glib.gpr
}


package()
{
   cd $srcdir/spawn-$pkgver-20230428-162D4-src

   DESTDIR=$pkgdir \
   make install

   LIBRARY_TYPE=relocatable \
   gprinstall -p --prefix=$pkgdir/usr gnat/spawn_glib.gpr

   # Install the license.
   #
   install -D -m644 \
      LICENSE.txt   \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}