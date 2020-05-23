# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer:  Rod Kay               <charlie5  on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
_upstream_ver=2020-20200429-1998C
pkgver=2020
pkgrel=1

pkgdesc="Libadalang-based tools: gnatpp, gnatmetric and gnatstub"
url='https://github.com/AdaCore/libadalang-tools'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libadalang')
makedepends=('gprbuild')

_checksum=740372d8ffb1e4755a99bead2d78dace904235c0
source=("${pkgname}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgname}-${_upstream_ver}-src.tar.gz")
sha1sums=("$_checksum")

build() 
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    gprbuild \
        -XBUILD_MODE=prod \
        -XLIBRARY_TYPE=relocatable \
        -XXMLADA_BUILD=relocatable \
        -XLALTOOLS_SET=all \
        -P src/build.gpr -p -j0 \
        -R -cargs $CFLAGS -largs $LDFLAGS
}

package()
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    install -Dm755 -t "$pkgdir/usr/bin/" bin/{gnatpp,gnatmetric,gnatstub}
}
