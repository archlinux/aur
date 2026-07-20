# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=moonstone
pkgname=moonstone-bin
pkgver=0.3.23
pkgrel=2
pkgdesc="Modern, deterministic Lua project environments and package manager written in Zig"
arch=('x86_64' 'aarch64')
url="https://github.com/moonstone-sh/moonstone"
license=('Apache-2.0')
provides=("moonstone=$pkgver")
conflicts=('moon' 'moonbit' 'moonstone')
source=("LICENSE::https://raw.githubusercontent.com/moonstone-sh/$_pkgname/main/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64-linux.tar.gz::https://github.com/moonstone-sh/$_pkgname/releases/download/v$pkgver/moon-x86_64-linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-linux.tar.gz::https://github.com/moonstone-sh/$_pkgname/releases/download/v$pkgver/moon-aarch64-linux.tar.gz")
sha256sums=('34e0c3e08e21097a322600567c2bd824cd316a2ce34338131ec9a4af20846aac')
sha256sums_x86_64=('455ad96c89546be277c95e9e6e5f54b6dd854dbfb2d8254a2af5a722d622ee14')
sha256sums_aarch64=('14726adbebc7de26caa9d4720eea21f53216435846ac657264a73e9fcac7b6ec')

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
