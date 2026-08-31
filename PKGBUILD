# Maintainer: Cristo Cola <kristokola@hotmail.com>
pkgname=fast-folder-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Template-driven project folder generator with a guided TUI and CLI (fastf) — prebuilt binary"
arch=(x86_64)
url="https://github.com/cristocola/fast-folder"
license=(MIT)
provides=(fast-folder)
conflicts=(fast-folder)
# Static musl build from the GitHub release — no runtime deps.
source=("$url/releases/download/v$pkgver/fastf-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('a9ab37d16a8ef9817b4368f31b92ff5a5196b1c338c93e3ca146968b6e96127a')

package() {
  cd "fastf-v$pkgver-x86_64-unknown-linux-musl"

  install -Dm755 fastf "$pkgdir/usr/bin/fastf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Completions + man pages ship inside the release archive
  install -Dm644 completions/fastf.bash "$pkgdir/usr/share/bash-completion/completions/fastf"
  install -Dm644 completions/fastf.zsh "$pkgdir/usr/share/zsh/site-functions/_fastf"
  install -Dm644 completions/fastf.fish "$pkgdir/usr/share/fish/vendor_completions.d/fastf.fish"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"

  # Desktop integration (.desktop + icons ship inside the release archive)
  install -Dm644 fastf.desktop "$pkgdir/usr/share/applications/fastf.desktop"
  for size in 48 128 256; do
    install -Dm644 "icons/fastf-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/fastf.png"
  done
}
