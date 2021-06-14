# Maintainer k4leg <python.bogdan@gmail.com>

pkgname=texlive-pscyr
pkgver=0.4d_beta9
pkgrel=1
pkgdesc="Type1 cyrillic fonts collection"
url="ftp://scon155.phys.msu.su/pub/russian/psfonts/"
license=('LPPL-1.2')
source=("$url/0.4d-beta/PSCyr-0.4-beta9-tex.tar.gz"
        "$url/0.4d-beta/PSCyr-0.4-beta9-type1.tar.gz"
        "$pkgname.maps")
sha512sums=('2cd1c99b4a85e72cda7824869036374436b82fe787eaa2307263e64237ad5955b22279c33c436e4b1d4c0d065751984f57bbbb91422f1055b1bdff6581631429'
            'b648a60a768f14102e30dcc6d628d1a0f3cf1e2351d973621d3468c2bdf502726f12089cf0ac2d129ca6fbd694b78a48f184ce02e19d4d5641adebfea2e382f2'
            '1a4a52a8ef602cdbf2b00328fab3fd31abd5c3dfce71267c1bfe97d7d40434522f9558853643538974afea9f5d5f63d659d051512c4ee0a066d19380ada42a00')
arch=('any')
depends=('texlive-core' 'texlive-latexextra' 'texlive-langcyrillic')
install=texlive-pscyr.install

package() {
    cd "$srcdir/PSCyr"
    TEXMF=`kpsewhich -expand-var='$TEXMFMAIN'`
    for i in {dvipdfm/base,{tex/latex,fonts/{tfm,vf,type1,afm}/public}/pscyr}; do
        install -dm755 "$pkgdir/$TEXMF/$i"
        for j in "$i"/*; do
            install -m644 "$j" "$pkgdir/$TEXMF/$i/"
        done
    done
    install -dm755 "$pkgdir/var/lib/texmf/arch/installedpkgs"
    install -m644 "$srcdir/$pkgname.maps" "$pkgdir/var/lib/texmf/arch/installedpkgs/"
    for i in map enc; do
        install -dm755 "$pkgdir/$TEXMF/fonts/$i"
        for j in dvips/pscyr/*."$i"; do
            install -Dm644 "$j" "$pkgdir/$TEXMF/fonts/$i/${j/*\/}"
        done
    done
    install -dm755 "$pkgdir/$TEXMF/doc/fonts/pscyr"
    for i in LICENSE doc/README.koi doc/PROBLEMS ChangeLog manifest.txt; do
        install -Dm644 "$i" "$pkgdir/$TEXMF/doc/fonts/pscyr/${i/*\/}"
    done
}

# vim: syntax=sh
