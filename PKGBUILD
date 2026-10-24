# Maintainer: duanluan <duanluan@outlook.com>

pkgname=qoder-cn
pkgver=0.4.11
pkgrel=1
pkgdesc='Qoder CN desktop app, an agentic coding workbench from Alibaba'
arch=('x86_64')
url='https://qoder.cn/'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'hicolor-icon-theme'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: system tray icon support'
)
conflicts=('qoder-cn-bin')
options=('!strip')
source_x86_64=(
  "Qoder-CN-linux-${pkgver}-amd64.deb::https://qoder-app.oss-cn-beijing.aliyuncs.com/qoder-app/releases/${pkgver}/Qoder-CN-linux-amd64.deb"
)
noextract=("Qoder-CN-linux-${pkgver}-amd64.deb")
sha256sums_x86_64=(
  'd5452c2729b490ef1d79794563955efa6628e904803425d748e7100e50a0a50f'
)

package() {
  cd "${srcdir}"

  bsdtar -xf "Qoder-CN-linux-${pkgver}-amd64.deb" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Electron's sandbox helper must retain its setuid bit for sandboxed renderers.
  chmod 4755 "${pkgdir}/opt/Qoder CN/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/Qoder CN/qoder-cn" "${pkgdir}/usr/bin/qoder-cn"

  install -Dm644 "${pkgdir}/opt/Qoder CN/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/Qoder CN/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
