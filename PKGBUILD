# Maintainer: mrFrok <https://github.com/mrFrok>
pkgname=lfff-bin
pkgver=3.0.0
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
  '2e78eaa08ced7231c643f59fcffce7d167c6c00b269a990bbb6777b7fcc45d82'
  '44dd910daedcab7ca09b259b29e4843e5d1b8bfd3cea69bbf8fc1db29cc12fc5'
)
sha256sums_aarch64=(
  'c8262e889990417c198a51adecbdf124622ebf0e5e2b8b6b8e77641b61fee2a5'
  '9b3a80ebcc94cd47d156cc0788adb07e185b5ee548d0b67494f0e6a035373bc6'
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
