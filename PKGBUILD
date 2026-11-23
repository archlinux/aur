# Maintainer: Sentria <admin@sentrialabs.com>

pkgname=maryanne-bin
pkgver=4.5.7
pkgrel=23
pkgdesc='Maryanne: EPUB & PDF reader with natural voice read-aloud'
arch=('x86_64' 'aarch64')
url='https://maryanne.app'
license=('custom')
options=('!strip')
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'libsecret')
release_repo='finnvyrn/maryanne-releases'
source_x86_64=(
  "maryanne-${pkgver}-${pkgrel}-x86_64.AppImage::https://github.com/${release_repo}/releases/download/v${pkgver}/Maryanne-x86_64.AppImage"
)
source_aarch64=(
  "maryanne-${pkgver}-${pkgrel}-aarch64.tar.gz::https://github.com/${release_repo}/releases/download/v${pkgver}/Maryanne-linux-aarch64.tar.gz"
)
source=(
  "maryanne-${pkgver}-${pkgrel}.desktop::https://github.com/${release_repo}/releases/download/v${pkgver}/maryanne.desktop"
  "maryanne-${pkgver}-${pkgrel}.png::https://github.com/${release_repo}/releases/download/v${pkgver}/maryanne.png"
)
sha256sums_x86_64=(
  'e99f947bf92a9a7c7b23b36ba781ca261be68d2bafb8dbec4e4d13d1bbe0ec85'
)
sha256sums_aarch64=(
  '7c0e7861337c291cace1c4fb633ba9d5e66af67227b7d07a1eaf0c2e3336f679'
)
sha256sums=(
  '95d45120b42db100bbf316c828d3a49f4b3486c128daaf7c0a11b4a8734f7c15'
  '316d51254a7b1dee6198a46a7c2ba54c7c1c140a56ce2682bc0b0e5c309e3aa7'
)

package() {
  if [[ "${CARCH}" == 'x86_64' ]]; then
    install -Dm755 "maryanne-${pkgver}-${pkgrel}-x86_64.AppImage" "${pkgdir}/opt/maryanne/Maryanne-x86_64.AppImage"
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/maryanne/Maryanne-x86_64.AppImage "${pkgdir}/usr/bin/maryanne"
  else
    install -d "${pkgdir}/opt/maryanne"
    bsdtar -xzf "maryanne-${pkgver}-${pkgrel}-aarch64.tar.gz" -C "${pkgdir}/opt/maryanne"
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/maryanne/maryanne "${pkgdir}/usr/bin/maryanne"
  fi
  install -Dm644 "maryanne-${pkgver}-${pkgrel}.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/maryanne.png"
  install -d "${pkgdir}/usr/share/applications"
  sed -e 's|^Icon=.*|Icon=/usr/share/icons/hicolor/1024x1024/apps/maryanne.png|'     -e '/^Exec=/a TryExec=maryanne'     "maryanne-${pkgver}-${pkgrel}.desktop" > "${pkgdir}/usr/share/applications/maryanne.desktop"
}
