# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: Matthijs Tadema <M dot J dot Tadema at gmail dot com>
# Contributor: Lorenzo Gaifas <brisvag at gmail dot com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=snapgene-viewer
pkgver=7.2.1
_pkgver_major=$(cut -d '.' -f 1 <<<"$pkgver")
_pkgver_major_middle=$(cut -d '.' -f 1-2 <<<"$pkgver")
pkgrel=1
pkgdesc='View plasmid maps, annotate features and share sequences (snapgene freeware edition)'
arch=('x86_64')
url='https://www.snapgene.com/snapgene-viewer'
license=('custom')
depends=('qt6-base'
         'qt6-webchannel'
         'qt6-5compat'
         'qt6-declarative'
         'qt6-positioning'
         'qt6-svg'
         'qt6-webengine'
         'libsm'
         'fontconfig'
         'nspr'
         'xz'
         'expat'
         'glibc'
         'gcc-libs'
         'libc++'
         'libc++abi'
         'dbus'
         'krb5'
         'libxcb'
         'libxkbcommon-x11'
         'xcb-util-image'
         'xcb-util-wm'
         'libx11'
         'libxkbfile'
         'xcb-util-keysyms'
         'xcb-util-renderutil'
         'nss'
         'hicolor-icon-theme'
         'libice'
         'libglvnd'
         'libxext'
         'openssl-1.1'
         'zlib'
)
# A valid licence is required to use the full version of snapgene
source=("https://cdn.snapgene.com/downloads/SnapGeneViewer/"$_pkgver_major".x/"$_pkgver_major_middle"/"$pkgver"/snapgene_viewer_"$pkgver"_linux.rpm" "snapgene-viewer")
sha512sums=('7a0c4c87a3130030041182ffb05c9f6e3c4d528713b6a2a429cb8a31306e20e45765bff3590a99a3decace14fd4c3d06685c06c63df054a6d6ee22b1dac26840' '082c0fe6d8d5a6b8822d73589718d1baf9d4f651092c4beea8247e8a7af7ee9597858502124300111d020a07b3da612609caca21eb78fc889e6948d579ee7ea9')

package() {
  cd "$pkgdir"
  cp -r "$srcdir/opt" "$pkgdir"
  cp -r "$srcdir/usr" "$pkgdir"
  mkdir "$pkgdir/usr/bin"
  cp "$srcdir/snapgene-viewer" "$pkgdir/usr/bin/"

  sed -i 's`${INSTALLED_DIR}/snapgene-viewer "$@"`QT_QPA_PLATFORM="xcb" ${INSTALLED_DIR}/snapgene-viewer "$@"`' "$pkgdir/opt/gslbiotech/snapgene-viewer/snapgene-viewer.sh"
    
  chmod a+x "$pkgdir/usr/bin/snapgene-viewer"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/gslbiotech/snapgene-viewer/resources/licenseAgreement.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
  cd "${pkgdir}"
  rm -rf usr/lib
}
