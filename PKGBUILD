# Maintainer: Sentria <admin@sentrialabs.com>
pkgname=maryanne-bin
pkgver=3.10.0
pkgrel=2
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
  'f95b3469ef4e50d99994aeff867e2b87cb10963794f08148e8ddad55a6bd39a2'
  '85a5b6670cbb8296ff3bac16441e0a8aae978985f4dc37def5e2c69cf307fa8b'
  '8da5125a1eefa4f6b4cb2bff1c33e24c0fc93623e000fd5aa99c85f596a0f6da'
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
