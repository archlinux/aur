# Maintainer: mrFrok <https://github.com/mrFrok>
pkgname=lfff-bin
pkgver=3.7.2
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
  '0e89377c7b1665b38a183ac54110bc9fb10334d9ef831529737cce3951d5a1f6'
  '143aee05c8f7368336edfef4d84cb5b4c6dd9920f118251a10bbb0c5fbc7a8f5'
)
sha256sums_aarch64=(
  '12a1e6f47297703ff5965f08c59bd358e130be090758294cb2b91c0ae09539e4'
  '899e32817fae473b3414ed71af600d62b3c1ac47ffc7444d4f1d3ebc579e889a'
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
