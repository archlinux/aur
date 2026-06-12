# Maintainer: faris0x <farisalfarhan@icloud.com>
# Contributor: faris0x <farisalfarhan@icloud.com>

pkgname=mut
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal-based LaTeX editor (μT) — Micro-like editing, pdflatex build, Zathura preview"
arch=('x86_64')
url="https://github.com/faris0x/muT"
license=('MIT')
depends=(
  'texlive-core'
  'zathura'
  'zathura-pdf-poppler'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/faris0x/muT/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Binary
  install -Dm755 target/release/muT "$pkgdir/usr/bin/muT"

  # Desktop entry
  install -Dm644 resources/muT.desktop "$pkgdir/usr/share/applications/muT.desktop"

  # Icon
  install -Dm644 resources/muT.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/muT.svg"

  # Man page
  install -Dm644 resources/muT.1 "$pkgdir/usr/share/man/man1/muT.1"

  # Shell completions (optional — bash)
  install -Dm644 resources/completions/muT.bash "$pkgdir/usr/share/bash-completion/completions/muT" 2>/dev/null || true
}
