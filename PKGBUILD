# Maintainer: mrFrok <https://github.com/mrFrok>
pkgname=lfff-bin
pkgver=3.7.1
pkgrel=1
pkgdesc="Free, open-source firmware flasher for Android A/B devices — CLI + GUI (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/mrFrok/LibreFastbootFirmwareFlasher"
license=('GPL-3.0-only')
depends=('android-tools' 'libxkbcommon' 'fontconfig' 'libgl')
optdepends=(
  'aria2: firmware download support'
  'payload_dumper: OTA payload extraction (cargo install payload_dumper)'
)
provides=('lfff' 'lfff-gui')
conflicts=('lfff' 'lfff-gui-bin')

source_x86_64=(
  "lfff-${pkgver}-linux-x86_64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-linux-x86_64.tar.gz"
  "lfff-gui-${pkgver}-linux-x86_64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-gui-linux-x86_64.tar.gz"
)
source_aarch64=(
  "lfff-${pkgver}-linux-aarch64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-linux-aarch64.tar.gz"
  "lfff-gui-${pkgver}-linux-aarch64.tar.gz::https://github.com/mrFrok/LibreFastbootFirmwareFlasher/releases/download/v$pkgver/lfff-gui-linux-aarch64.tar.gz"
)
sha256sums_x86_64=(
  '0fdb9b5fc235145b01af1c0d430aaf2ea393373f9f050eedde1df1740129e2b3'
  'a34c7cf03a2ad2a6a4462b1bcbb4e5e3b03bafa5366f1b7e9d41a13331966aef'
)
sha256sums_aarch64=(
  'e51ed604e34b31eb16d1445ae3be8a158f3348a6fa0aac8c7f1182553c4bed3e'
  '40f18ed77b7a2bfc22066a16936faa0b7bb52bbb2a80ab53196bba32b793a33b'
)

source+=(
  "lfff-gui.desktop::https://raw.githubusercontent.com/mrFrok/LibreFastbootFirmwareFlasher/main/lfff-gui.desktop"
  "lfff-gui.svg::https://raw.githubusercontent.com/mrFrok/LibreFastbootFirmwareFlasher/main/lfff-gui.svg"
)
sha256sums+=('SKIP' 'SKIP')

package() {
  install -Dm755 "lfff"     "$pkgdir/usr/bin/lfff"
  install -Dm755 "lfff-gui" "$pkgdir/usr/bin/lfff-gui"
  install -Dm644 "lfff-gui.desktop" "$pkgdir/usr/share/applications/lfff-gui.desktop"
  install -Dm644 "lfff-gui.svg"     "$pkgdir/usr/share/icons/hicolor/scalable/apps/lfff-gui.svg"

  # Shell completions, produced by the binary this package ships. Requires the
  # binary to be runnable here, which holds because AUR builds run on the same
  # architecture they target.
  "$srcdir/lfff" completion bash > "$srcdir/lfff.bash"
  "$srcdir/lfff" completion zsh  > "$srcdir/_lfff"
  "$srcdir/lfff" completion fish > "$srcdir/lfff.fish"
  install -Dm644 "$srcdir/lfff.bash" "$pkgdir/usr/share/bash-completion/completions/lfff"
  install -Dm644 "$srcdir/_lfff"     "$pkgdir/usr/share/zsh/site-functions/_lfff"
  install -Dm644 "$srcdir/lfff.fish" "$pkgdir/usr/share/fish/vendor_completions.d/lfff.fish"
}
