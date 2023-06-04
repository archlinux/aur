# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="slack-on-keys-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="Control your Slack from any app window with keyboard shortcuts ⚡ Set up custom keyboard shortcuts for various Slack actions"
arch=('x86_64')
url="https://github.com/yakshaG/slack-on-keys"
license=('MIT')
depends=('libcups' 'libxcomposite' 'at-spi2-core' 'gcc-libs' 'nss' 'pango' 'libdrm' 'cairo' 'libxcb' 'mesa' 'alsa-lib' 'nspr' \
    'libxrandr' 'dbus' 'glib2' 'nodejs' 'libxext' 'libxfixes' 'expat' 'libx11' 'libxdamage' 'gtk3' 'libxkbcommon' 'glibc')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/yakshaG/slack-on-keys/main/LICENSE")
sha256sums=('73e383feed41399ef29c309be84eeb252ad6b26ab51c3db40b8485384e856fc1'
            'f95d9068a4ccb1cbc8bad397f046494b5e2d6546fd6be7546edd5c26765cd956')
 
package() {
  bsdtar -xf data.tar.zst -C "${pkgdir}" --gname root --uname root
  install -Dm755 -d "${pkgdir}/opt/"
  mv "${pkgdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt/"
  sed 's|Exec=slack-on-keys|Exec=/opt/slack-on-keys/slack-on-keys|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -rf "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  chmod 0755 "${pkgdir}/opt/${pkgname%-bin}/chrome-sandbox"
}