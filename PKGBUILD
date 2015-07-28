# Contributor: Rod Kay   <charlie5 on #ada at freenode.net>

_pkgname=aws
pkgname=ada-web-server
pkgver=3.3.0.0
pkgrel=1
pkgdesc="A complete embeddable Web application framework for Ada."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/$_pkgname
license=(GPL)
groups=(gcc-ada)

depends=(gcc-ada asis)
makedepends=(gprbuild)

provides=($_pkgname ada-web-server)
conflicts=($_pkgname ada-web-server)

#source=(http://downloads.dragonlace.net/src/$_pkgname-$pkgver.tar.bz2)
source=(http://mirrors.cdn.adacore.com/art/fe47e20355c57bba144256718c13cfa3aa4ce189)

sha256sums=('9efcc9f6f07c26d29b112a01aff8c2309d9f8342431d94a7135c6759d63f6500')



build() 
{
    cd $srcdir/$_pkgname-gpl-2015-src

    make setup build
}


package() 
{
    cd $srcdir/$_pkgname-gpl-2015-src

    make DESTDIR="$pkgdir" install

    mkdir -p $pkgdir/usr/lib/gnat/manifests
    mv  $pkgdir/usr/share/gpr/aws.gpr         $pkgdir/usr/lib/gnat
    mv  $pkgdir/usr/share/gpr/manifests/aws   $pkgdir/usr/lib/gnat/manifests
    rm -fr $pkgdir/usr/share/gpr

    rm $pkgdir/usr/include/aws.relocatable/makefile
    rm $pkgdir/usr/include/aws/makefile
}
