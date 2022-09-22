# Maintainer: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=openlisp
pkgver=11.6.0
pkgrel=1
pkgdesc="A full and efficient ISO/IEC 13816:2007(E) ISLISP Implementation"
arch=('x86_64' 'i686')
url="http://www.eligis.com"
license=("custom")
depends=("sh")

source_x86_64=("http://www.eligis.com/downloads/${pkgname}-${pkgver}-Linux-x86_64.tar.gz")
source_i686=("http://www.eligis.com/downloads/${pkgname}-${pkgver}-Linux-i686.tar.gz")

sha256sums_x86_64=('f98406b8e4e9ce5bae422fededcf9a6ffa05e7839e8fd49846fcd808fff074c5')
sha256sums_i686=('be55729738bf10d2318a9d4ad7fe107dc2678ccdb6f394a505c059d6467da725')

package()
{
    cd "$pkgname-$pkgver"

    install -d "$pkgdir/usr/share/doc/$pkgname"
    cp -a --no-preserve=ownership README NEWS ChangeLog AUTHORS "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/README"

    install -Dm644 "emacs/openlisp.el" "$pkgdir/usr/share/emacs/site-lisp/openlisp.el"

    install -d "$pkgdir/usr/lib/$pkgname"
    cp -r -a --no-preserve=ownership bench contrib lib net uxlisp "$pkgdir/usr/lib/$pkgname"

    echo -e "#!/bin/sh\ncd /usr/lib/$pkgname\n/usr/lib/$pkgname/uxlisp \$*\ncd - > /dev/null" > openlisp
    install -Dm755 openlisp "$pkgdir/usr/bin/openlisp"
}
