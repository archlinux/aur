# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-core
pkgver=2018
pkgrel=1

pkgdesc='Gnat components collection - Core packages.'
url='https://github.com/AdaCore/gnatcoll-core/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'libgpr')
makedepends=('gprbuild')

provides=('gnatcoll')
conflicts=('gnatcoll')

source=('http://mirrors.cdn.adacore.com/art/5b0819dfc7a447df26c27a99')
sha1sums=('213105933eb2deb4d08f6b5beab518ad6c70fbac')


build()
{
    cd gnatcoll-core-gpl-2018-src

    make setup BUILD=PROD prefix=/usr
    make PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R
}


package()
{
    cd gnatcoll-core-gpl-2018-src

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1
}
