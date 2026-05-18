# Maintainer: shuv <kyle@latitudes.io>

pkgname=shuvscode-bin
_pkgname=shuvscode
pkgver=1.120.03315.shuv1
pkgrel=1
pkgdesc="shuvscode: an opinionated VS Code/VSCodium fork (bundles Electron)"
arch=('x86_64')
url="https://github.com/shuv1337/shuvscode"
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'gtk3'
  'libdrm'
  'libsecret'
  'libx11'
  'libxkbfile'
  'libxss'
  'libxtst'
  'mesa'
  'nss'
  'pango'
)
optdepends=(
  'gnome-keyring: GNOME keyring/secrets support'
  'kwallet: KDE wallet/secrets support'
)
provides=("shuvscode=${pkgver}")
conflicts=('shuvscode' 'shuvscode-git' 'shuvscode-electron')
options=('!strip' '!debug')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/shuv1337/shuvscode/releases/download/v${pkgver}/shuvscode-linux-x64.tar.gz"
  "shuvscode.sh"
  "shuvscode.desktop"
)
sha256sums=(
  'e348916b0af653422fec10506690efe2adddd25d698fae0344f3007cbe81a48e'
  '27281b54125f31c0f89fd5a68b686b9ef10b21f1e8bba1f6eb71e89a43779419'
  '07d8fc26dba7ef143732980b1bdc497f66815570e16c83a20009524f477ae697'
)

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"

  cp -a "${srcdir}/${_pkgname}/." "${pkgdir}/opt/${_pkgname}/"

  install -Dm755 "${srcdir}/shuvscode.sh" \
    "${pkgdir}/usr/bin/shuvscode"

  install -Dm644 "${srcdir}/shuvscode.desktop" \
    "${pkgdir}/usr/share/applications/shuvscode.desktop"

  if [[ -f "${pkgdir}/opt/${_pkgname}/resources/app/LICENSE.txt" ]]; then
    install -Dm644 "${pkgdir}/opt/${_pkgname}/resources/app/LICENSE.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  if [[ -f "${pkgdir}/opt/${_pkgname}/resources/app/resources/linux/code.png" ]]; then
    install -Dm644 "${pkgdir}/opt/${_pkgname}/resources/app/resources/linux/code.png" \
      "${pkgdir}/usr/share/icons/hicolor/512x512/apps/shuvscode.png"
  fi
}
