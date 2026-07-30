# Maintainer: Timothy D Beach <beachtimothyd@gmail.com>
pkgname=ear
pkgver=0.4.0
pkgrel=1
pkgdesc="many text sources, one output bus: your ears — local neural TTS reader (CLI + GUI)"
arch=('x86_64')
url="https://github.com/timbeach/ear"
license=('MIT' 'OFL-1.1')
options=(!lto)
install=ear.install
depends=('mpv' 'ffmpeg' 'python')
makedepends=('cargo')
optdepends=('poppler: PDF ingestion (pdftotext)'
            'piper-tts-bin: fast local TTS tier (or: pipx install piper-tts)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timbeach/ear/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0793eec69691c15aff320c78253eebb4b2a057cb49dd815b08f4773c3d436c2a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --workspace --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --workspace --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/ear "$pkgdir/usr/bin/ear"
  install -Dm755 target/release/ear-cli "$pkgdir/usr/bin/ear-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ear-desk/assets/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/aegix-integration.md "$pkgdir/usr/share/doc/$pkgname/aegix-integration.md"
}
