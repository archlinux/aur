# Contributor: Rod Kay   <charlie5 on #ada at freenode.net>

_pkgname=aws
pkgname=ada-web-server
pkgver=2016
pkgrel=1
pkgdesc="A complete embeddable Web application framework for Ada."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/$_pkgname
license=(GPL)
groups=(gcc-ada)

depends=(gcc-ada asis prepare_gnat_util)
makedepends=(gprbuild)

provides=($_pkgname ada-web-server)
conflicts=($_pkgname ada-web-server)

source=(http://mirrors.cdn.adacore.com/art/57399112c7a447658d00e1cd)
sha1sums=('e4f35b2f47fee69fa179a180dbe85372919558f9')



build() 
{
    cd $srcdir/$_pkgname-gpl-2016-src
    make setup 
    make build
}


package() 
{
    cd $srcdir/$_pkgname-gpl-2016-src

    make DESTDIR="$pkgdir" install

    mkdir -p $pkgdir/usr/lib/gnat/manifests
    mv  $pkgdir/usr/share/gpr/aws.gpr         $pkgdir/usr/lib/gnat
    mv  $pkgdir/usr/share/gpr/manifests/aws   $pkgdir/usr/lib/gnat/manifests
    rm -fr $pkgdir/usr/share/gpr
}
