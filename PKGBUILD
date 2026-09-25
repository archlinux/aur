# Maintainer: boujuan <https://github.com/boujuan>

pkgname=wg-dice-overlay-bin
_pkgname=wg-dice-overlay
pkgver=1.1.6
pkgrel=1
pkgdesc="Transparent 3D dice overlay with real physics for Warhammer 40.000: Wrath & Glory"
arch=('x86_64')
url="https://github.com/boujuan/wg-dice-overlay"
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'libcups'
  'libdrm'
  'libnotify'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
)
optdepends=(
  'vulkan-radeon: RADV Vulkan support for AMD GPU'
  'vulkan-intel: Vulkan support for Intel GPU'
  'nvidia-utils: Vulkan support for NVIDIA GPU'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/boujuan/wg-dice-overlay/releases/download/v${pkgver}/WG-Dice-Overlay-${pkgver}-linux-x64.tar.gz"
  "${_pkgname}.desktop"
  "icon.png"
  "LICENSE"
)
sha256sums=(
  'a7e355ef77f14c78fdeb18352bbbf85f0ec4ce6d58a25087d75e0b23e78f5aaf'
  '5039adc5d0f0f7f72bb446a9b23ff8042e1742dd971a1fd0220eb5f12de158ca'
  '3cc7a138de4d38f162cfde22bc6c8bbfad4c27b5fefbf950692d83daecf0da12'
  '81369e3a9ecb260645a1fa5b395ce183784580d7963bfc61a229d047cdc204bd'
)

package() {
  # Install application directory
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}/linux-unpacked/." "${pkgdir}/opt/${_pkgname}/"

  # Ensure binary is executable
  chmod 755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox" 2>/dev/null || true

  # Symlink to /usr/bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # App icon
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  # License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
