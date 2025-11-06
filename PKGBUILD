# Maintainer: MightyElemental <https://github.com/mightyelemental>
pkgname=plutonium-launcher-bin
pkgver=1
pkgrel=1
pkgdesc="Plutonium launcher (BO2/BO1/MW3/WaW mod client) with Arch-friendly Wine/DXVK setup"
arch=('x86_64')
url="https://plutonium.pw/"
license=('custom')
depends=(
  'wine'
  'winetricks'
  'dxvk-bin'
  'vulkan-icd-loader'
  'lib32-vulkan-icd-loader'
  'xorg-xrandr'   # common runtime need for Wine games
)
optdepends=(
  'zenity: show a GUI progress dialog on first-time setup'
  'nvidia-utils: NVIDIA Vulkan driver'
  'lib32-nvidia-utils: NVIDIA 32-bit Vulkan driver'
  'mesa: AMD/Intel OpenGL/Vulkan'
  'lib32-mesa: AMD/Intel 32-bit OpenGL/Vulkan'
)
provides=('plutonium-launcher')
conflicts=('plutonium-launcher')
install=plutonium-launcher-bin.install
source=(
  "plutonium.exe::https://cdn.plutonium.pw/updater/plutonium.exe"
  "plutonium"
  "plutonium.desktop"
  "plutonium-icon.svg"
  "plutonium-launcher-bin.install"
  "LICENSE.plutonium"
)
sha256sums=('SKIP'
            'b56bec04dbc664e870042df4be4cc480eb144dea1ef6a0c3eda557732ec06121'
            'ef1458b11f9999455205fe0b561a55536dbb292f84e2ffd7590b4da4fc54b291'
            '18cf3f3037a077b2bff29dbf97c64eabf885f35dd390478d1ef103540e025ace'
            '17a98e4ae6315d59e1e99afc653375570d9e5d2be6b6c66ca8f293737b7e180d'
            '9142767d9a4f3231de8055498f187605d575828c50e9e0a443c6991e3c797000')

package() {
  install -d "$pkgdir/opt/plutonium" \
             "$pkgdir/usr/bin" \
             "$pkgdir/usr/share/applications" \
             "$pkgdir/usr/share/licenses/$pkgname"

  # launcher exe
  install -m644 "$srcdir/plutonium.exe" "$pkgdir/opt/plutonium/plutonium.exe"

  # wrapper script
  install -m755 "$srcdir/plutonium" "$pkgdir/usr/bin/plutonium-launcher"

  # desktop entry
  install -m644 "$srcdir/plutonium.desktop" "$pkgdir/usr/share/applications/plutonium.desktop"

  # icon (SVG, scalable)
  install -Dm644 "$srcdir/plutonium-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/plutonium.svg"

  # license stub (project is freeware/3rd party; provide upstream notice)
  install -m644 "$srcdir/LICENSE.plutonium" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
