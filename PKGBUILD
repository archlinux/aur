# Maintainer: faris0x <farisalfarhan@icloud.com>
# Contributor: faris0x <farisalfarhan@icloud.com>

pkgname=mut
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal-based LaTeX editor with pdflatex build and Zathura preview"
arch=('x86_64')
url="https://github.com/faris0x/muT"
license=('MIT')
depends=(
  'texlive-core'
  'zathura'
  'zathura-pdf-poppler'
)
makedepends=('cargo' 'gcc')
source=("muT-$pkgver.tar.gz::https://github.com/faris0x/muT/archive/v$pkgver.tar.gz")
sha256sums=('2f294cd39f9dc00eb06c9532f8cc41f9f488a051128ee5f1d1e1e91b88a7de11')
validpgpkeys=()

prepare() {
  cd "$srcdir/muT-$pkgver"
}

build() {
  cd "$srcdir/muT-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/muT-$pkgver"

  # Binary
  install -Dm755 target/release/muT "$pkgdir/usr/bin/muT"

  # Desktop entry
  install -Dm644 resources/muT.desktop "$pkgdir/usr/share/applications/muT.desktop"

  # Icon
  install -Dm644 resources/muT.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/muT.svg"

  # Man page
  install -Dm644 resources/muT.1 "$pkgdir/usr/share/man/man1/muT.1"

  # Shell completions (optional, bash)
  install -Dm644 resources/completions/muT.bash "$pkgdir/usr/share/bash-completion/completions/muT" 2>/dev/null || true
}
