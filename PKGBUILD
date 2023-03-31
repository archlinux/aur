# Based on snapgene-viewer package by Antony Lee <anntzer dot lee at gmail dot com>
# Maintainer: Matthijs Tadema <M dot J dot Tadema at gmail dot com>
# Co-Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>
# Co-Maintainer: Bitals <me at bitals dot xyz>
pkgname=snapgene
pkgver=6.2.1
_pkgver_major=$(cut -d '.' -f 1 <<<"$pkgver")
_pkgver_major_middle=$(cut -d '.' -f 1-2 <<<"$pkgver")
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene/'
license=('custom')
# A valid licence is required to use the full version of snapgene
source=("https://cdn.snapgene.com/downloads/SnapGene/"$_pkgver_major".x/"$_pkgver_major_middle"/"$pkgver"/snapgene_"$pkgver"_linux.rpm")
sha512sums=('b48db17adcd4fc83c626280b762ee35b9165dc773c6b820a0a46360dd6bad080bdfd456ce0be0c77e58563ad41eabc1d3d16474a1319cbf8927307399e085f74')

package() {
    cd "$pkgdir"
    cp -r "$srcdir/opt" "$pkgdir"
    cp -r "$srcdir/usr" "$pkgdir"
    mkdir "$pkgdir/usr/bin"
    cat <<'EOF' >"$pkgdir/usr/bin/snapgene"
#!/bin/sh
# Snapgene is not localized and genbank exports are invalid in other
# locales, so we just set LANG=C.
LANG=C /opt/gslbiotech/snapgene/snapgene.sh
EOF
    chmod a+x "$pkgdir/usr/bin/snapgene"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/gslbiotech/snapgene/resources/licenseAgreement.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}
