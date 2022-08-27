# Based on snapgene-viewer package by Antony Lee <anntzer dot lee at gmail dot com>
# Maintainer: Matthijs Tadema <M dot J dot Tadema at gmail dot com>
# Co-Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>
# Co-Maintainer: Bitals <me at bitals dot xyz>
pkgname=snapgene
pkgver=6.1.1
_pkgver_major=$(cut -d '.' -f 1 <<<"$pkgver")
_pkgver_major_middle=$(cut -d '.' -f 1-2 <<<"$pkgver")
pkgrel=2
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene/'
license=('custom')
# A valid licence is required to use the full version of snapgene
source=("https://cdn.snapgene.com/downloads/SnapGene/"$_pkgver_major".x/"$_pkgver_major_middle"/"$pkgver"/snapgene_"$pkgver"_linux.rpm")
sha512sums=('90406508ae636826b690bbecdbd8fd62f34bc95417dbd0db0349b5092f6dffe475e6e3eff8a96f1dd5e39195a5d77e8c67cf1df719dc3a4d317a27eedfcae3cc')

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
