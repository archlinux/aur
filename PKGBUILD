# Maintainer: Bitals <me at bitals dot xyz>
# Co-Maintainer: Matthijs Tadema <M dot J dot Tadema at gmail dot com>
# Co-Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>
# Co-Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-veiwer
pkgver=7.0.2
_pkgver_major=$(cut -d '.' -f 1 <<<"$pkgver")
_pkgver_major_middle=$(cut -d '.' -f 1-2 <<<"$pkgver")
pkgrel=1
pkgdesc='Software for plasmid mapping, primer design, and restriction site analysis'
arch=('x86_64')
url='http://www.snapgene.com/products/snapgene-viewer/'
license=('custom')
# A valid licence is required to use the full version of snapgene
source=("https://cdn.snapgene.com/downloads/SnapGeneViewer/"$_pkgver_major".x/"$_pkgver_major_middle"/"$pkgver"/snapgene_viewer_"$pkgver"_linux.rpm")
sha512sums=('13a00197c60239842ed649e4730faa3783beebb04f107ed6d7a03f5523edf98cb8c2037bb87cb700924a6a417d2264e603094a3b3b64771ad460fb1f3caa544d')

package() {
  cd "$pkgdir"
  cp -r "$srcdir/opt" "$pkgdir"
  cp -r "$srcdir/usr" "$pkgdir"
  mkdir "$pkgdir/usr/bin"
  cat <<'EOF' >"$pkgdir/usr/bin/snapgene-viewer"
#!/bin/sh
# Snapgene Viewer is not localized and genbank exports are invalid in other
# locales, so we just set LANG=C.
QT_QPA_PLATFORM="xcb" LANG=C /opt/gslbiotech/snapgene-viewer/snapgene-viewer.sh
EOF
  chmod a+x "$pkgdir/usr/bin/snapgene-viewer"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/gslbiotech/snapgene-viewer/resources/licenseAgreement.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
  cd "${pkgdir}"
  rm -rf usr/lib
}
