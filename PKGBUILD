# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=asis
pkgver=2018
pkgrel=1
pkgdesc="Allows Ada programs access to the syntactic and semantic structure of source code. Also provides extra tools such as gnatpp."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools
license=(GPL)
groups=(gcc-ada)

depends=('gcc-ada>=8.2.1' 'gcc-ada<9.0.0' 'gnat_util' 'gnatcoll-core')
makedepends=('gprbuild')

source=(http://mirrors.cdn.adacore.com/art/5b0819e0c7a447df26c27ab8)
sha1sums=('c338044768412af787c8cff13c0d952ed688df11')


build() 
{
    cd $srcdir/$pkgname-gpl-$pkgver-src

    make all
    make tools
}


package() 
{
    cd $srcdir/$pkgname-gpl-$pkgver-src

    PREFIX=/usr  make install       prefix=${pkgdir}/usr
    PREFIX=/usr  make install-tools prefix=${pkgdir}/usr

    # Rid tools superseded by libadalang-tools.
    rm ${pkgdir}/usr/bin/gnatmetric
    rm ${pkgdir}/usr/bin/gnatpp
    rm ${pkgdir}/usr/bin/gnatstub
}
