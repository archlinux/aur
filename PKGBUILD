# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-core
pkgver=2020
_upstream_ver=2020-20200429-19B7C
pkgrel=1

pkgdesc='Gnat components collection - Core packages.'
url='https://github.com/AdaCore/gnatcoll-core/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libgpr')
makedepends=('gprbuild')

provides=('gnatcoll-core')
conflicts=('gnatcoll' 'gnatcoll-core-git')

_checksum=c94f2ac914cb305f6bef174329fa0b5003d84935
source=("https://community.download.adacore.com/v1/${_checksum}?filename=${pkgname}-${_upstream_ver}-src.tar.gz")
sha1sums=("$_checksum")

build()
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS=-R
}

package()
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1
}
