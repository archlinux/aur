# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-viewer
pkgver=4.2.5
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene_viewer/'
license=('custom')
source=("snapgene_viewer_${pkgver}_linux.rpm::http://www.snapgene.com/products/download.php?product=viewer&majorRelease=${pkgver:0:3}&minorRelease=${pkgver}&os=linux_rpm")
sha512sums=('66c5e0595d57c1280cd1a6577f8dfec5bace08dd561b5321d0fc0eb46e69ba76841381147d63ee51161d299ae4ae6a83c0177a75054a67acf05646737150800f')

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
