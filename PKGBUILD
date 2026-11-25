# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=veasel-desktop-bin
pkgver=0.106.0.next.0
pkgrel=1
pkgdesc="Veasel Code Desktop application (Focus and World)"
arch=('x86_64')
url="https://veasel.dev"
license=('MIT')
options=('!debug' '!strip')
noextract=('veasel-desktop-linux-amd64.deb')
depends=('at-spi2-core' 'glibc' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: system tray support')
_tag="v${pkgver//.next./-next.}"
_release_version="${pkgver//.next./-next.}"
source=(
  "veasel-desktop-linux-amd64.deb::https://github.com/veasel-labs/veasel/releases/download/${_tag}/veasel-desktop-${_release_version}-linux-amd64.deb"
  "LICENSE::https://raw.githubusercontent.com/veasel-labs/veasel/${_tag}/LICENSE"
)
sha256sums=(
  '730dc5b314930ecaf85f6c51d71b8e2e032877b4215a0ed9e64dd9863eb34638'
  'e150ff1e9cd21b388ec966f3d77ed4731e86e4731b17f127e879f72ff5b2e3d5'
)

package() {
  local payload="${srcdir}/veasel-desktop-payload"
  install -d "${payload}"
  ar p "${srcdir}/veasel-desktop-linux-amd64.deb" data.tar.xz | bsdtar -xJf - -C "${payload}"

  install -d "${pkgdir}/opt"
  cp -a "${payload}/opt/Veasel" "${pkgdir}/opt/Veasel"
  install -Dm644 "${payload}/usr/share/applications/veasel-desktop.desktop" \
    "${pkgdir}/usr/share/applications/veasel-desktop.desktop"
  install -Dm644 "${payload}/usr/share/icons/hicolor/512x512/apps/veasel-desktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/veasel-desktop.png"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
