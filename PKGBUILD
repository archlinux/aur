# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Prebuilt Nib binary from upstream GitHub releases (no Go toolchain needed).
# Upstream: https://github.com/daniel-alexander4/nib
pkgname=nib-bin
pkgver=2.50.4
pkgrel=2
pkgdesc='Complete PDF toolkit that runs entirely on your own machine (fill, OCR, redact, compare, sign, PDF/A) — prebuilt binary'
arch=('x86_64' 'aarch64')
url='https://github.com/daniel-alexander4/nib'
license=('AGPL3')
depends=('hicolor-icon-theme')
optdepends=(
  'chromium: UI in app mode (or any Chromium-family browser / firefox via xdg-open)'
  'xdg-utils: open-in-browser fallback'
  'libreoffice: Office → PDF conversion'
  'ghostscript: PDF/A conversion and PostScript import'
  'poppler: export the current page as SVG (pdftocairo)'
  'libheif: HEIC/HEIF photo import (heif-dec/heif-convert)'
)
provides=('nib')
conflicts=('nib' 'nib-git' 'nib-pdf-git')
source_x86_64=("nib-$pkgver-linux-amd64::https://github.com/daniel-alexander4/nib/releases/download/v$pkgver/nib-$pkgver-linux-amd64"
               "nib.desktop::https://raw.githubusercontent.com/daniel-alexander4/nib/v$pkgver/build/nib.desktop"
               "nib.svg::https://raw.githubusercontent.com/daniel-alexander4/nib/v$pkgver/build/nib.svg")
source_aarch64=("nib-$pkgver-linux-arm64::https://github.com/daniel-alexander4/nib/releases/download/v$pkgver/nib-$pkgver-linux-arm64"
               "nib.desktop::https://raw.githubusercontent.com/daniel-alexander4/nib/v$pkgver/build/nib.desktop"
               "nib.svg::https://raw.githubusercontent.com/daniel-alexander4/nib/v$pkgver/build/nib.svg")
sha256sums_x86_64=('6568231c148f6e1faad7c28972e35413bc36688ea0ad44d103f9496f06810ef7'
                   'SKIP'
                   'SKIP')
sha256sums_aarch64=('0de6432b4463793473f57b598d9a6d7ff6b639fbd2e7c8f7bfd21640b0ce10f8'
                    'SKIP'
                    'SKIP')

package() {
  case "$CARCH" in
    x86_64) bin="nib-$pkgver-linux-amd64" ;;
    aarch64) bin="nib-$pkgver-linux-arm64" ;;
  esac
  install -Dm0755 "$srcdir/$bin" "$pkgdir/usr/bin/nib"
  install -Dm0644 "$srcdir/nib.desktop" "$pkgdir/usr/share/applications/nib.desktop"
  install -Dm0644 "$srcdir/nib.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/nib.svg"
}
