# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=adasat
pkgdesc='Implementation of a DPLL-based SAT solver in Ada.'
pkgver=24.0w
pkgrel=1

url=https://github.com/AdaCore/AdaSAT
arch=(i686 x86_64)
license=(Apache)

depends=(gcc-ada
         python-e3-core)     # This is here to try to force AUR helpers to install this dependency, which is required by 'langkit'.
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/$pkgname-$pkgver-20230324-16568-src.tar.gz)
sha256sums=(8e5d14931c456144575501e6d45dd1bbe5adebcea05346ac1940087bf8c5ce9d)


build()
{
    cd $srcdir/$pkgname-$pkgver-20230428-16702-src

    BUILD_MODE=prod \
    make all-libs
}


package()
{
    cd $srcdir/$pkgname-$pkgver-20230428-16702-src

    BUILD_MODE=prod         \
    INSTALL_DIR=$pkgdir/usr \
    make install 

    # Install the license.
    #
    install -D -m644 \
       LICENSE       \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}