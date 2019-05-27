# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-viewer
pkgver=4.3.8
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene_viewer/'
license=('custom')
source=("snapgene_viewer_${pkgver}_linux.rpm::https://www.snapgene.com/local/targets/viewer_download.php?os=linux_rpm&majorRelease=latest&minorRelease=latest")
sha512sums=('8142e9224e6352712b7e9c80699439e39cc098f0af6556ca589b74be34de1b34abfe067fd8c9ffd176bf7c21f0f5ce8b302757d91ba968ea60cad86b95f6cfdd')

package() {
    cd "$pkgdir"
    cp -r "$srcdir/opt" "$pkgdir"
    cp -r "$srcdir/usr" "$pkgdir"
    mkdir "$pkgdir/usr/bin"
    cat <<'EOF' >"$pkgdir/usr/bin/snapgene-viewer"
#!/bin/sh
# Snapgene Viewer is not localized and genbank exports are invalid in other
# locales, so we just set LANG=C.
LANG=C /opt/gslbiotech/snapgene-viewer/snapgene-viewer.sh
EOF
    chmod a+x "$pkgdir/usr/bin/snapgene-viewer"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/gslbiotech/snapgene-viewer/resources/licenseAgreement.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}
