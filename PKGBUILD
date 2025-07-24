# Maintainer:  Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
pkgdesc='Libadalang-based tools for Ada: gnatpp, gnatmetric and gnatstub.'
pkgver=26.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/libadalang-tools
arch=(i686 x86_64)
license=(GPL3)

depends=(libadalang templates_parser libvss)
makedepends=(gprbuild gpr which)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/libadalang-tools-26.0w-20250413-161B1-src.tar.gz)
sha256sums=(24264a2e24a171df5138063b1f95aa3e0e9c1048f0686e723461de22fc7d82b0)


build()
{
  cd $srcdir/libadalang-tools-26.0w-20250416-16676-src

   export BUILD_MODE=prod

   LIBRARY_TYPE=relocatable \
   make lib

   LIBRARY_TYPE=relocatable \
   make bin
}


package()
{
   cd $srcdir/libadalang-tools-26.0w-20250416-16676-src

   export DESTDIR=$pkgdir/usr
   export BUILD_MODE=prod

   LIBRARY_TYPE=relocatable \
   make install-lib
   
   LIBRARY_TYPE=relocatable \
   make install-bin-strip

  # Install the licenses.
  #
  install -D -m644  \
     LICENSE        \
     $pkgdir/usr/share/licenses/$pkgname/LICENSE
}