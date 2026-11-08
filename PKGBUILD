# Maintainer: Sentria <admin@sentrialabs.com>
pkgname=maryanne-bin
pkgver=4.3.1
pkgrel=9
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
  'ce8928da73c0884e9ea2c384749b6803c27ba086b86e017889b1c9dc6f2bf673'
  '85a5b6670cbb8296ff3bac16441e0a8aae978985f4dc37def5e2c69cf307fa8b'
  'c7b730b33842b286c416b1644ab6d213c2b24182760bbefcad010362cb49e2fe'
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
