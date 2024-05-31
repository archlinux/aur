# Maintainer:  Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
pkgdesc='Libadalang-based tools for Ada: gnatpp, gnatmetric and gnatstub.'
pkgver=25.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/libadalang-tools
arch=(i686 x86_64)
license=(GPL3)

depends=(libadalang templates_parser libvss)
makedepends=(gprbuild gpr which)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/$pkgname-$pkgver-20240408-1625A-src.tar.gz)
sha256sums=(931f5bfef6abf00117d44a176601176dffbf6f5903087e7c62badb4f98c3b08b)


build()
{
  cd $srcdir/$pkgname-$pkgver-20240505-16471-src

   export BUILD_MODE=prod
   make lib

   LIBRARY_TYPE=relocatable \
   make bin
}


package()
{
   cd $srcdir/$pkgname-$pkgver-20240505-16471-src

   export DESTDIR=$pkgdir/usr
   export BUILD_MODE=prod

   make install-lib
   make install-bin-strip

  # Install the licenses.
  #
  install -D -m644  \
     LICENSE        \
     $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -D -m644  \
     COPYING3       \
     $pkgdir/usr/share/licenses/$pkgname/COPYING3
}