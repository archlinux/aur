# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-core
pkgver=2019
pkgrel=1

pkgdesc='Gnat components collection - Core packages.'
url='https://github.com/AdaCore/gnatcoll-core/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libgpr')
makedepends=('gprbuild')

provides=('gnatcoll-core')
conflicts=('gnatcoll' 'gnatcoll-core-git')

source=('http://mirrors.cdn.adacore.com/art/5cdf8ae231e87a8f1d425052')
sha1sums=('99ea2dc09e018deb14f15c00e8c4b7b21f94c94f')

build()
{
    cd $srcdir/gnatcoll-core-2019-20190515-24AD8-src

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS=-R
}

package()
{
    cd $srcdir/gnatcoll-core-2019-20190515-24AD8-src

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1
}
