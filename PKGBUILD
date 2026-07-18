# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=moonstone
pkgname=moonstone-bin
pkgver=0.3.19
pkgrel=1
pkgdesc="Modern, deterministic Lua project environments and package manager written in Zig"
arch=('x86_64' 'aarch64')
url="https://github.com/moonstone-sh/moonstone"
license=('Apache-2.0')
depends=()
provides=('moonstone')
conflicts=('moonstone' 'moon-bin' 'moon')
source=("LICENSE::https://raw.githubusercontent.com/moonstone-sh/$_pkgname/main/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64-linux.tar.gz::https://github.com/moonstone-sh/$_pkgname/releases/download/v$pkgver/moon-x86_64-linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-linux.tar.gz::https://github.com/moonstone-sh/$_pkgname/releases/download/v$pkgver/moon-aarch64-linux.tar.gz")
sha256sums=('34e0c3e08e21097a322600567c2bd824cd316a2ce34338131ec9a4af20846aac')
sha256sums_x86_64=('7096518a2b457d4b8a2492a08505d691f749a43642ecda8421543ece04ab9461')
sha256sums_aarch64=('95764dd8548fd674cd9d0e3db54102feaf7c81f95f6ae799c1360be1ad4f6dcf')

prepare() {
  cd "$srcdir"
  ./moon completions bash > completions.bash
  ./moon completions zsh > completions.zsh
  ./moon completions fish > completions.fish
}

package() {
  cd "$srcdir"

  # Binary
  install -Dm755 moon "$pkgdir/usr/bin/moon"

  # Shell completions
  install -Dm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/moon"
  install -Dm644 completions.zsh "$pkgdir/usr/share/zsh/site-functions/_moon"
  install -Dm644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/moon.fish"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
