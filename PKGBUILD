# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

_pkgname=aws
pkgname=ada-web-server
pkgver=2018
pkgrel=1
pkgdesc="A complete embeddable Web application framework for Ada."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/$_pkgname
license=(GPL)
groups=(gcc-ada)

depends=('gcc-ada>=8.2.1' 'gcc-ada<9.0.0' 'asis')
makedepends=(gprbuild texlive-bin)

provides=($_pkgname)

source=(http://mirrors.cdn.adacore.com/art/5b0819e0c7a447df26c27abd)
sha1sums=('4ef71505336b2a5019081ac820e93d9854390c53')


build() 
{
    cd $srcdir/$_pkgname-gpl-2018-src

    make setup
    make build

    cd docs
    make html
}


package() 
{
    cd $srcdir/$_pkgname-gpl-2018-src

    make DESTDIR="$pkgdir" install

    mkdir -p $pkgdir/usr/lib/gnat/manifests
    mv  $pkgdir/usr/share/gpr/aws.gpr         $pkgdir/usr/lib/gnat
    mv  $pkgdir/usr/share/gpr/manifests/aws   $pkgdir/usr/lib/gnat/manifests
    rm -fr $pkgdir/usr/share/gpr
}
