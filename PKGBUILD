# Maintainer: flear <teymurzadehuseyn14 at gmail dot com>
pkgname=butaglyph
pkgver=0.2.1
pkgrel=1
pkgdesc='Fast prompt for bash, zsh, fish and PowerShell, with presets, gradients and its own git reader'
arch=('x86_64' 'aarch64')
url='https://github.com/Huseynteymurzade28/butaglyph'
license=('MIT')
options=('!debug')
makedepends=('zig>=0.16.0' 'zig<0.17.0')
optdepends=('ttf-nerd-fonts-symbols: icons for the default look and most presets')
provides=('butaglyph')
conflicts=('butaglyph-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d0dec1e07dbb1d8646a776191327866a1cf129e85cae11e06b9af0d4f975f873')

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
