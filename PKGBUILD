# Maintainer: gustavojoaquin <gustavojoaquincalizayaleon2@gmail.com>
pkgname=lm-studio
pkgver=0.4.14
pkgrel=1
pkgdesc="LM Studio - Run AI models, locally and privately (.deb)"
arch=('x86_64')
url="https://lmstudio.ai"
license=('0BSD')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'alsa-lib' 'libdrm' 'mesa')
options=('!strip')
_pkgver=${pkgver}-${pkgrel}
source=("https://installers.lmstudio.ai/linux/x64/${_pkgver}/LM-Studio-${_pkgver}-x64.deb")
sha256sums=('b6a5a61f0058f72f8ad77ceaa6a669b473303f304574ea8f0ba54ccf60e68ee2')

package() {
  tar -xJf data.tar.xz -C "${pkgdir}"

  install -Dm644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/lm-studio.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/lm-studio.png"
  install -Dm644 "${pkgdir}/opt/LM-Studio/resources/app/.webpack/Icon-512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/lm-studio.png"
  install -Dm644 "${pkgdir}/opt/LM-Studio/resources/app/.webpack/Icon-512x512.png" "${pkgdir}/usr/share/pixmaps/lm-studio.png"

  rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/LM-Studio/lm-studio "${pkgdir}/usr/bin/lm-studio"

  chmod 4755 "${pkgdir}/opt/LM-Studio/chrome-sandbox" || true
}
