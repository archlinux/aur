# Maintainer: Sentria <admin@sentrialabs.com>
pkgname=maryanne-bin
pkgver=4.2.0
pkgrel=7
pkgdesc='Maryanne: EPUB & PDF reader with natural voice read-aloud'
arch=('x86_64')
url='https://maryanne.app'
license=('custom')
options=('!strip')
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'libsecret')
release_repo='finnvyrn/maryanne-releases'
source=(
  "maryanne-${pkgver}.AppImage::https://github.com/${release_repo}/releases/download/v${pkgver}/Maryanne-x86_64.AppImage"
  "maryanne.desktop::https://github.com/${release_repo}/releases/download/v${pkgver}/maryanne.desktop"
  "maryanne.png::https://github.com/${release_repo}/releases/download/v${pkgver}/maryanne.png"
)
sha256sums=(
  'adee1d26ecf3337e95b371efad9022b4a8d4a4ad72e2c48dcc30328302ecb74d'
  '85a5b6670cbb8296ff3bac16441e0a8aae978985f4dc37def5e2c69cf307fa8b'
  'd1b25e06c340ae827beb382838d75c82bad264f4e123953b5adaee995c19cf94'
)

package() {
  install -Dm755 "maryanne-${pkgver}.AppImage" \
    "${pkgdir}/opt/maryanne/Maryanne-x86_64.AppImage"
  install -Dm644 maryanne.png \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/maryanne.png"
  install -d "${pkgdir}/usr/share/applications"
  sed -e 's|^Icon=.*|Icon=/usr/share/icons/hicolor/1024x1024/apps/maryanne.png|' \
    -e '/^Exec=/a TryExec=maryanne' \
    maryanne.desktop > "${pkgdir}/usr/share/applications/maryanne.desktop"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/maryanne/Maryanne-x86_64.AppImage \
    "${pkgdir}/usr/bin/maryanne"
}
