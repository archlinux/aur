# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=adasat
pkgdesc='Implementation of a DPLL-based SAT solver in Ada.'
pkgver=25.0w
pkgrel=1

url=https://github.com/AdaCore/AdaSAT
arch=(i686 x86_64)
license=(Apache)

depends=(gcc-ada)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/$pkgname-$pkgver-20240408-16385-src.tar.gz)
sha256sums=(abe44831dc69c160d1310730957f71d9a69391d7abddf30df4d0e689abc99fd6)


build()
{
    cd $srcdir/$pkgname-$pkgver-20240505-1633A-src

    BUILD_MODE=prod \
    make all-libs
}


package()
{
    cd $srcdir/$pkgname-$pkgver-20240505-1633A-src

    BUILD_MODE=prod         \
    INSTALL_DIR=$pkgdir/usr \
    make install 

    # Install the license.
    #
    install -D -m644 \
       LICENSE       \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}