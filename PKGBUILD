# Maintainer: flear <teymurzadehuseyn14 at gmail dot com>
pkgname=butaglyph
pkgver=0.5.0
pkgrel=1
pkgdesc='Fast prompt for bash, zsh, fish and PowerShell, with presets, gradients and its own git reader'
arch=('x86_64' 'aarch64')
url='https://github.com/Huseynteymurzade28/butaglyph'
license=('MIT')
options=('!debug')
makedepends=('zig>=0.17.0' 'zig<0.18.0')
optdepends=('ttf-nerd-fonts-symbols: icons with .glyphs = .nerd')
provides=('butaglyph')
conflicts=('butaglyph-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a6e624677e4e39d5017130ac6f3b37297d08c2b4b30f6dbfcfe1ac75a8572bf6')

build() {
  cd "$pkgname-$pkgver"
  ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache" \
    zig build -Doptimize=ReleaseFast -Dcpu=baseline --prefix "$srcdir/out"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/out/bin/buta" "$pkgdir/usr/bin/buta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md docs/configuration.md docs/internals.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 examples/*.zon -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
