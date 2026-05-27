# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatformat
pkgdesc='An opinionated code formatter for the Ada language.'
pkgver=27.0w
pkgrel=1
epoch=1

url='https://github.com/AdaCore/gnatformat'

arch=(i686 x86_64 aarch64)
license=(Apache-2.0)

depends=(libadalang)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gnatformat-src.tar.gz)
sha256sums=(2a8d1e2684563cc958ef2b0817a2876383bf00699c0ffe3baaf992f0cbad3a98)


build()
{
   cd $srcdir/gnatformat-27.0w-20260409-162F3-src

   LIBRARY_TYPE=relocatable make lib
   LIBRARY_TYPE=relocatable make bin
}


package()
{
   cd $srcdir/gnatformat-27.0w-20260409-162F3-src

   make PREFIX=$pkgdir/usr install-lib
   make PREFIX=$pkgdir/usr install-bin-stripped


   ## Install the license.
   #
   install -D -m644 \
      LICENSE.txt   \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
