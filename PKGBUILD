# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatformat
pkgdesc='An opinionated code formatter for the Ada language.'
pkgver=26.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/gnatformat

arch=(i686 x86_64)
license=(Apache)

depends=(libadalang)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/gnatformat-26.0w-20250416-16670-src.tar.gz)
sha256sums=(0daaec673f4a8ab4336584196b10a028fa9960df5b784bc8d9c9b247d099a6b6)



build()
{
   cd $srcdir/gnatformat-26.0w-20250416-16670-src

   export LIBRARY_TYPE=relocatable

   make lib
   make bin
}



package()
{
   cd $srcdir/gnatformat-26.0w-20250416-16670-src
   
   export LIBRARY_TYPE=relocatable

   PREFIX=$pkgdir/usr \
   make install-lib

   PREFIX=$pkgdir/usr \
   make install-bin-stripped

   # Install the license.
   #
   install -D -m644 \
      LICENSE.txt   \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}