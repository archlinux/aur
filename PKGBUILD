# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=moonstone
pkgname=moonstone-bin
pkgver=0.4.18
pkgrel=1
pkgdesc="Modern, deterministic Lua project environments and package manager written in Zig"
arch=('x86_64' 'aarch64')
url="https://github.com/moonstone-sh/moonstone"
license=('Apache-2.0')
provides=("moonstone=$pkgver")
conflicts=('moon' 'moonbit' 'moonstone')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/moonstone-sh/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("https://github.com/moonstone-sh/$_pkgname/releases/download/v$pkgver/moon-v$pkgver-x86_64-linux-gnu.tar.gz")
source_aarch64=("https://github.com/moonstone-sh/$_pkgname/releases/download/v$pkgver/moon-v$pkgver-aarch64-linux-gnu.tar.gz")
sha256sums=('34e0c3e08e21097a322600567c2bd824cd316a2ce34338131ec9a4af20846aac')
sha256sums_x86_64=('8190012a0dddd1359a1f464f69385c9e584171703c53cb44042d109ff086f133')
sha256sums_aarch64=('7d842c45c2b0ec28647dccee489d941e2f7d06ff08d865e8343e6b42e10b010d')

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
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
