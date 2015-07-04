# Maintainer: Michael Duell <michael.duell@rub.de>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=html2ps
pkgver=1.0b7
pkgrel=7
pkgdesc="An HTML to PostScript converter written in Perl."
arch=('i686' 'x86_64')
url="http://user.it.uu.se/~jan/html2ps.html"
license=('GPL2')
depends=('ghostscript' 'perl' 'texlive-bin')
source=(http://user.it.uu.se/~jan/html2ps-$pkgver.tar.gz)

package() {
    __script=$srcdir/$pkgname-$pkgver/$pkgname

    # Fixes Bug: https://bugzilla.redhat.com/show_bug.cgi?id=822117
    sed -e '/^  local($\[)=0;$/d' -i $__script

    # Set some variables in the script
    sed -i "s#/it/sw/share/www/lib/html2ps/html2psrc#/etc/html2psrc#g" $__script
    sed -i "s#/opt/misc/lib/html2ps/html2psrc#/etc/html2psrc#g" $__script
    sed -i "s#/opt/misc/lib/html2ps/html2ps.html#/usr/share/html2ps/html2ps.html#g" $__script 
    sed -i "s#Ghostscript: 0;#Ghostscript: 1;#g" $__script
    sed -i "s#TeX: 0;#TeX: 1;#g" $__script
    sed -i 's# file: "";# file: "/usr/share/texmf/tex/generic/hyphen/hyphen.tex";#g' $__script

    install -D -m755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
    install -D -m644 $srcdir/$pkgname-$pkgver/sample $pkgdir/etc/html2psrc
    install -D -m644 $srcdir/$pkgname-$pkgver/sample $pkgdir/usr/share/$pkgname/etc/html2psrc-sampleconfig
    install -D -m644 $srcdir/$pkgname-$pkgver/$pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
    install -D -m644 $srcdir/$pkgname-$pkgver/${pkgname}rc.5 $pkgdir/usr/share/man/man5/${pkgname}rc.5
    install -D -m644 $srcdir/$pkgname-$pkgver/$pkgname.html $pkgdir/usr/share/$pkgname/$pkgname.html

}

sha384sums=('e1c95370257b22f408848914b56703334ee0f1ef7683b045bbef67142a7577fc5a8c3fba0790fd90a380dcdf4f5c5eb7')
