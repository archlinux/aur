# Maintainer: LaT-SKY <miprota@163.com>
pkgname=oddity-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Native Linux launcher for Neverness To Everness"
arch=('x86_64')
url="https://github.com/LaT-SKY/Oddity"
license=('GPL-3.0-or-later')
depends=(
  'nss'
  'libxss'
  'libxtst'
  'libdrm'
  'mesa'
  'libcups'
  'gtk3'
  'libudev.so=1-64'
  'libpulse'
  'alsa-lib'
  'librsvg'
  'libsecret'
  'hicolor-icon-theme'
  'desktop-file-utils'
  'xdg-utils'
)
optdepends=(
  'umu-launcher: run the game through Proton'
  'gamemode: optimize game processes in Game Mode'
  'mangohud: show the optional performance overlay'
  'gamescope: control game window, resolution and frame rate'
  'polkit: authorize system GameMode CPU and GPU configuration'
  'xdg-desktop-portal: request idle and suspend inhibition'
)
provides=('oddity')
conflicts=('oddity')
options=('!strip' '!debug')
install=oddity-bin.install
_upstream=0.1.2
source_x86_64=("oddity-0.1.2-linux-x86_64.tar.gz::https://github.com/LaT-SKY/Oddity/releases/download/oddity-v0.1.2/oddity-0.1.2-linux-x86_64.tar.gz")
sha256sums_x86_64=('d58c56ba3ceb2796611b16646f8100707ec5fc4a7516420a8607def12b5b0639')

package() {
  local dir="$srcdir/oddity-${_upstream}-linux-x86_64"
  install -dm755 "$pkgdir/opt/Oddity" "$pkgdir/usr/bin"
  cp -a "$dir/." "$pkgdir/opt/Oddity/"
  for binary in oddity nte-cli oddity-recovery; do
    ln -s "../../opt/Oddity/$binary" "$pkgdir/usr/bin/$binary"
  done
  install -Dm644 "$dir/oddity-recovery.desktop" "$pkgdir/usr/share/applications/oddity-recovery.desktop"
  install -Dm644 "$dir/oddity.desktop" "$pkgdir/usr/share/applications/oddity.desktop"
  local size
  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "$dir/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/oddity.png"
  done
  install -Dm644 "$dir/LICENSE.oddity" "$pkgdir/usr/share/licenses/oddity/LICENSE"
  install -Dm644 "$dir/THIRD_PARTY.md" "$pkgdir/usr/share/licenses/oddity/THIRD_PARTY.md"
  install -Dm644 "$dir/README.md" "$pkgdir/usr/share/doc/oddity/README.md"
}
