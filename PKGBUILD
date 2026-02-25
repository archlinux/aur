pkgname=blockdeletee-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Voice-controlled Minecraft block deletion via RCON + Vosk (TUI/Qt) - prebuilt binary"
arch=('x86_64')
url="https://github.com/amethyst-bin/BlockDeletee"
license=('custom')
depends=(
  'glibc'
  'gcc-libs'
  'qt6-base'
  'qt6-declarative'
  'alsa-lib'
  'vosk-api'
)
optdepends=(
  'pipewire: audio stack'
  'pulseaudio: audio stack'
)
provides=('blockdeletee')
conflicts=('blockdeletee')
options=('!debug' '!strip')
source=(
  "BlockDeletee-linux-x64-v${pkgver}.zip::https://github.com/amethyst-bin/BlockDeletee/releases/download/v${pkgver}/BlockDeletee-linux-x64-v${pkgver}.zip"
  "blockdeletee-launcher.sh"
)
sha256sums=(
  '04f21d91ac32d9aecfe8c8fbade912032f7b8673b34c77c11dfd9d12711f89cd'
  'SKIP'
)
install=blockdeletee-bin.install

package() {
  install -dm755 "${pkgdir}/opt/blockdeletee"
  cp -a "${srcdir}/BlockDeletee/." "${pkgdir}/opt/blockdeletee/"

  # Ship example config in a safer location and keep app dir clean.
  if [[ -f "${pkgdir}/opt/blockdeletee/config.json" ]]; then
    mv "${pkgdir}/opt/blockdeletee/config.json" "${pkgdir}/opt/blockdeletee/config.example.json"
  fi

  install -Dm755 "${srcdir}/blockdeletee-launcher.sh" "${pkgdir}/usr/bin/blockdeletee"

  # License placeholder from upstream README until dedicated LICENSE is added.
  install -Dm644 "${pkgdir}/opt/blockdeletee/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
