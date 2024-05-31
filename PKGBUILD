# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=markdown
pkgdesc='A markdown parser for Ada.'
pkgver=25.0w
pkgrel=1

url=https://github.com/AdaCore/markdown
arch=(i686 x86_64)
license=(Apache)

depends=(libvss)
makedepends=(gprbuild-toolbox)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/$pkgname-$pkgver-20240505-16475-src.tar.gz)
sha256sums=(1b3799eecd41f5e0777110cdbc0fe5a523712f975e8217dd7b8c75b42f48ebf4)


build()
{
    cd $srcdir/$pkgname-$pkgver-20240505-16475-src
    BUILD_MODE=prod make all
}


package()
{
    cd $srcdir/$pkgname-$pkgver-20240505-16475-src

    make BUILD_MODE=prod \
         DESTDIR=$pkgdir \
         install
    
    # Install the licenses.
    #
    install -D -m644     \
       LICENSE.txt       \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}