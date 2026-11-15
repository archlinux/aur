# Maintainer: Sentria <admin@sentrialabs.com>
pkgname=maryanne-bin
pkgver=4.4.2
pkgrel=13
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
  '47fab7a16f81fff6aafa31c8bdaabd6951bb532c5f56c6d91ca527dcff1f3c88'
  '7c7c9381bda317a83b707e33e501411a6ae6d6e1bd923857029ae67522950f9b'
  'c0c3cb0aa3133984dd33a85d6581c5ef1c0bd93cde31c3d7a47a72a7d6f1b595'
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
