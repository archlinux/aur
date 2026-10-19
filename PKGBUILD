# Maintainer: flear <teymurzadehuseyn14 at gmail dot com>
pkgname=butaglyph
pkgver=0.3.0
pkgrel=1
pkgdesc='Fast prompt for bash, zsh, fish and PowerShell, with presets, gradients and its own git reader'
arch=('x86_64' 'aarch64')
url='https://github.com/Huseynteymurzade28/butaglyph'
license=('MIT')
options=('!debug')
makedepends=('zig>=0.16.0' 'zig<0.17.0')
optdepends=('ttf-nerd-fonts-symbols: icons with .glyphs = .nerd')
provides=('butaglyph')
conflicts=('butaglyph-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c41bb5ba56ae0931840974bc40c6c845fb6b0c84f3f2d0df8eb2c5f0103e9fa2')

build() {
  cd "$pkgname-$pkgver"
  zig build -Doptimize=ReleaseFast -Dcpu=baseline \
    --global-cache-dir "$srcdir/zig-cache" --prefix "$srcdir/out"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/out/bin/buta" "$pkgdir/usr/bin/buta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md docs/configuration.md docs/internals.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 examples/*.zon -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
