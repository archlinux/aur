# Maintainer:  Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
pkgdesc='Libadalang-based tools for Ada: gnatpp, gnatmetric and gnatstub.'
pkgver=24.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/libadalang-tools
arch=(i686 x86_64)
license=(GPL3)

depends=(libadalang templates_parser libvss)
makedepends=(gprbuild which)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/$pkgname-$pkgver-20230324-166A6-src.tar.gz)
sha256sums=(13837105dcb3e474ff96bcb530590e7404b87948c98ea33e05fa5a505eff76a5)


build()
{
  cd $srcdir/$pkgname-$pkgver-20230428-1627A-src

   export BUILD_MODE=prod
   make lib

   LIBRARY_TYPE=relocatable \
   make bin
}


package()
{
   cd $srcdir/$pkgname-$pkgver-20230428-1627A-src

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