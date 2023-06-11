# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=markdown
pkgdesc='A markdown parser for Ada.'
pkgver=24.0w
pkgrel=1

url=https://github.com/AdaCore/markdown
arch=(i686 x86_64)
license=(Apache)

depends=(libvss)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/$pkgname-$pkgver-20230428-162F9-src.tar.gz)
sha256sums=(6fc302143b73086f98a8a75853eb556b1736b4e18345637e463b90ad736aa523)


build()
{
    cd $srcdir/$pkgname-$pkgver-20230428-162F9-src
    BUILD_MODE=prod make
}


package()
{
    cd $srcdir/$pkgname-$pkgver-20230428-162F9-src

    make BUILD_MODE=prod \
         DESTDIR=$pkgdir \
         install
    
    # Install the licenses.
    #
    install -D -m644     \
       LICENSE.txt       \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE

    install -D -m644     \
       COPYING3          \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3
}