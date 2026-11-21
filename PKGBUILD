# Maintainer: Sentria <admin@sentrialabs.com>
pkgname=maryanne-bin
pkgver=4.5.4
pkgrel=19
pkgdesc='Maryanne: EPUB & PDF reader with natural voice read-aloud'
arch=('x86_64')
url='https://maryanne.app'
license=('custom')
options=('!strip')
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'libsecret')
release_repo='finnvyrn/maryanne-releases'
source=(
  "maryanne-${pkgver}-${pkgrel}.AppImage::https://github.com/${release_repo}/releases/download/v${pkgver}/Maryanne-x86_64.AppImage"
  "maryanne-${pkgver}-${pkgrel}.desktop::https://github.com/${release_repo}/releases/download/v${pkgver}/maryanne.desktop"
  "maryanne-${pkgver}-${pkgrel}.png::https://github.com/${release_repo}/releases/download/v${pkgver}/maryanne.png"
)
sha256sums=(
  '61650053a499e462375c9eeb593715a5ba96138b4e6623723a015b2125a74f41'
  '95d45120b42db100bbf316c828d3a49f4b3486c128daaf7c0a11b4a8734f7c15'
  'dbc3dbd4ac8240a61b18b9f2f530768c1e775481430fcad2d21396e6baeafdce'
)

package() {
  install -Dm755 "maryanne-${pkgver}-${pkgrel}.AppImage" \
    "${pkgdir}/opt/maryanne/Maryanne-x86_64.AppImage"
  install -Dm644 "maryanne-${pkgver}-${pkgrel}.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/maryanne.png"
  install -d "${pkgdir}/usr/share/applications"
  sed -e 's|^Icon=.*|Icon=/usr/share/icons/hicolor/1024x1024/apps/maryanne.png|' \
    -e '/^Exec=/a TryExec=maryanne' \
    "maryanne-${pkgver}-${pkgrel}.desktop" > "${pkgdir}/usr/share/applications/maryanne.desktop"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/maryanne/Maryanne-x86_64.AppImage \
    "${pkgdir}/usr/bin/maryanne"
}
