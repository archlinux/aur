# Maintainer:  Rod Kay               <charlie5  on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
pkgver=2019
pkgrel=2

pkgdesc="Libadalang-based tools: gnatpp, gnatmetric and gnatstub"
url='https://github.com/AdaCore/libadalang-tools'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libadalang')
makedepends=('gprbuild')

source=('https://community.download.adacore.com/v1/6b32f1aa7cc443bcaf268ef13fa46e3b0fdf147d?filename=libadalang-tools-2019-20190517-195C4-src.tar.gz')
sha1sums=('6b32f1aa7cc443bcaf268ef13fa46e3b0fdf147d')


build() 
{
    cd "$srcdir/libadalang-tools-2019-20190517-195C4-src"

    # In order to build the generated library, Langkit expects the QUEX_PATH to
    # be set.
    source /etc/profile.d/quex.sh

    make -j1 BUILD_MODE=prod LIBRARY_TYPE=relocatable
}

package()
{
    cd "$srcdir/libadalang-tools-2019-20190517-195C4-src"

    mkdir -p "$pkgdir/usr/bin"
    for program in gnatpp gnatmetric gnatstub
    do
        install -m755 bin/$program "$pkgdir/usr/bin/"
    done
}
