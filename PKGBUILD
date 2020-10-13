# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=asis
pkgver=2020
pkgrel=1
pkgdesc="Allows Ada programs access to the syntactic and semantic structure of source code."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools
license=(GPL)
groups=(gcc-ada)

depends=('gcc-ada' 'gnat_util' 'gnatcoll-core')
makedepends=('gprbuild')

source=('https://community.download.adacore.com/v1/8da969339493575a35edd20fbfe51bb06d2f9091?filename=asis-20.0w-20190814-153FE-src.tar.gz')
sha1sums=('8da969339493575a35edd20fbfe51bb06d2f9091')


build() 
{
    cd $srcdir/asis-20.0w-20190814-153FE-src

    make all
    make tools
}


package() 
{
    cd $srcdir/asis-20.0w-20190814-153FE-src

    PREFIX=/usr  make install       prefix=${pkgdir}/usr
    PREFIX=/usr  make install-tools prefix=${pkgdir}/usr

    # Rid tools superseded by libadalang-tools.
    #
    rm ${pkgdir}/usr/bin/gnatmetric
    rm ${pkgdir}/usr/bin/gnatpp
    rm ${pkgdir}/usr/bin/gnatstub
}
