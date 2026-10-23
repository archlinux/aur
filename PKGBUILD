# Maintainer: mrFrok <https://github.com/mrFrok>
pkgname=lfff-bin
pkgver=3.3.0
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
  'fcead69548abf034d4f5e5afaa1a5c6c1a71613972b865accb7c16f523b5a840'
  '046a3c5f1afb19ede17aacbce95818f1732b9bbe5420986d806e97d455c7f4be'
)
sha256sums_aarch64=(
  '2876db9d6e411b3007ecdb5fe8475324f64521df4fc9f6fd80699700e52d967f'
  '4eb1a93c75cbf5848967a7c8daacd7d125b2a30d330051881530846d46ae68e1'
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
