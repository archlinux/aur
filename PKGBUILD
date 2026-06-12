# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=xcursor-neutralplus
pkgver=1.2
pkgrel=5
pkgdesc='Nice mod of the Neutral X11 cursor theme'
url='https://www.kde-look.org/p/999928/'
arch=('any')
# Shipped LICENSE text is original Artistic-1.0 (9 clauses), not the Perl
# variant; verified against SPDX reference texts 2026-06-12.
license=('Artistic-1.0')
# Upstream hosting (opendesktop/pling) serves files only via expiring JWT
# links since ~2024; this Wayback snapshot of the unchanged 2016 tarball
# (md5 matches the original packaging) is the only stable URL.
source=("48837-Neutral_Plus_${pkgver}.tar.bz2::https://web.archive.org/web/20260612195404/https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1460735271/48837-Neutral_Plus_1.2.tar.bz2?response-content-disposition=attachment%3B%252048837-Neutral_Plus_1.2.tar.bz2&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20260612%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260612T195404Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Signature=96e389f1162306735ab67190bcdd4e832440611834888dc081ca7824178558c4")
sha256sums=('6b496406128fb3effd4e87159a29811d12a1b2f071e1341e67a6744c57d206dd')

latestver() {
    curl -fsSL 'https://www.pling.com/p/999928/loadFiles' |
        jq -r '.files[].name' |
        sed -nE 's/^[0-9]+-Neutral_Plus_([0-9.]+)\.tar\.bz2$/\1/p' |
        sort -V | tail -1
}

package()
{
  install -dm755 "$pkgdir"/usr/share/icons/Neutral_Plus
  cp -r "$srcdir"/Neutral_Plus/{cursors,index.theme} "$pkgdir"/usr/share/icons/Neutral_Plus
  install -Dm644 "$srcdir"/Neutral_Plus/LICENSE "$srcdir"/Neutral_Plus/COPYRIGHT \
    -t "$pkgdir"/usr/share/licenses/$pkgname/
}
