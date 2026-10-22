# Maintainer: mrFrok <https://github.com/mrFrok>
pkgname=lfff-bin
pkgver=3.2.0
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
  '341e96f2b320bcad5cd7b202ada590f8e6a414e1f468320404b6f9d652290925'
  '9361ecce3a87046ceb9e4f5e69c008c44dc67794b4e8fd5895e3cbd29aafb30e'
)
sha256sums_aarch64=(
  'e8defc4be5f5f119ff1b5a6f3cc1e2fca19dfd2cefc6d56ea77732e50531d6b2'
  '72a3e4dec15f29477c8ebf67bd16b6b795967733514d686f46e2b27911d2adef'
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
