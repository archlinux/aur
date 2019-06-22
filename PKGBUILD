# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=ada-web-server
pkgver=2019
pkgrel=1
pkgdesc="A complete embeddable Web application framework for Ada."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/aws
license=(GPL)
groups=(gcc-ada)

depends=('gcc-ada' 'asis')
makedepends=(gprbuild texlive-bin)

provides=(aws)

source=('http://mirrors.cdn.adacore.com/art/5cdf85a031e87aa2cdf16b19')
sha1sums=('110b3f623b4487874a714d3cf29aa945680766a6')


build() 
{
    cd $srcdir/aws-2019-20190512-18AB9-src

    make setup
    make build

    cd docs
    make html
}


package() 
{
    cd $srcdir/aws-2019-20190512-18AB9-src

    make DESTDIR="$pkgdir" install

    mkdir -p $pkgdir/usr/lib/gnat/manifests
    mv  $pkgdir/usr/share/gpr/aws.gpr         $pkgdir/usr/lib/gnat
    mv  $pkgdir/usr/share/gpr/manifests/aws   $pkgdir/usr/lib/gnat/manifests
    rm -fr $pkgdir/usr/share/gpr
}
