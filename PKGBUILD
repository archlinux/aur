# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-viewer
pkgver=3.0.3
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene_viewer/'
license=('custom')
depends=('shared-mime-info')
makedepends=('rpmextract')
install="$pkgname.install"
source=('snapgene_viewer_3.0.3_linux.rpm::http://www.snapgene.com/products/snapgene_viewer/download.php?&majorRelease=3.0&minorRelease=3.0.3&os=linux_rpm')
md5sums=('cc41ad744b999af732befdddabe45f1a')

# Some shared libraries could be stripped out and installed as dependencies
# instead.  However, directly calling the snapgene-viewer binary currently
# segfaults, so some care is needed.

package() {
    cd "$pkgdir"
    rpmextract.sh "$srcdir/snapgene_viewer_3.0.3_linux.rpm"
    mkdir "$pkgdir/usr/bin"
    cat <<'EOF' >"$pkgdir/usr/bin/snapgene-viewer" 
#!/bin/sh
# Snapgene Viewer is not localized and genbank exports are invalid in other
# locales, so we just set LANG=C.
LANG=C /opt/gslbiotech/snapgene-viewer/snapgene-viewer.sh
EOF
    chmod a+x "$pkgdir/usr/bin/snapgene-viewer"
}
