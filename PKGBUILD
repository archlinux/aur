# Based on snapgene-viewer package by Antony Lee <anntzer dot lee at gmail dot com>
# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: Matthijs Tadema <M dot J dot Tadema at gmail dot com>
# Contributor: Lorenzo Gaifas <brisvag at gmail dot com>
pkgname=snapgene
pkgver=7.1.0
_pkgver_major=$(cut -d '.' -f 1 <<<"$pkgver")
_pkgver_major_middle=$(cut -d '.' -f 1-2 <<<"$pkgver")
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene/'
license=('custom')
# A valid licence is required to use the full version of snapgene
source=("https://cdn.snapgene.com/downloads/SnapGene/"$_pkgver_major".x/"$_pkgver_major_middle"/"$pkgver"/"$pkgname"_"$pkgver"_linux.rpm" "snapgene")
sha512sums=('f167fec6eca0c34a253439a53ef07d40d6a0d31d97a76fd715588b44d1bddc15cdba5b8b86e5e8e44d47e07b14bd57fd3e1f532c59a76ea63a15d227141209aa' '705179cb29445b9d88953ffbc5c07050697bf3e68de49fe7eeefc1effd47c5db45ddec5b72510d3b577bcbc6d0df84e1b944f986d3c3b6e0e42065ae87fdc3f1')

package() {
    cd "$pkgdir"
    cp -r "$srcdir/opt" "$pkgdir"
    cp -r "$srcdir/usr" "$pkgdir"
    mkdir "$pkgdir/usr/bin"
    cp "$srcdir/snapgene" "$pkgdir/usr/bin/"

    sed -i 's`${INSTALLED_DIR}/snapgene "$@"`QT_QPA_PLATFORM="xcb" ${INSTALLED_DIR}/snapgene "$@"`' "$pkgdir/opt/gslbiotech/snapgene/snapgene.sh"
    
    chmod a+x "$pkgdir/usr/bin/snapgene"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/gslbiotech/snapgene/resources/licenseAgreement.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}
