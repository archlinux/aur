# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='dvm-bin'
pkgver='1.5.1'
pkgrel='1'
pkgdesc='Deno Version Manager - Easy way to manage multiple active deno versions'
provides=('dvm')
conflicts=('dvm')
depends=('bash')
arch=('x86_64')
url='https://github.com/justjavac/dvm'
license=('MIT')
source=(
  $pkgver.zip::"$url/releases/download/v$pkgver/dvm-x86_64-unknown-linux-gnu.zip"
  https://raw.githubusercontent.com/justjavac/dvm/v$pkgver/LICENSE
  dvm.bash
  dvm-install-instruction.bash
)
sha512sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  _dvm="$pkgdir/usr/bin/dvm.bin"

  _completion() {
    "$_dvm" completions "$1" >"completion.$1"
    install -Dm644 "completion.$1" "$2"
  }

  msg2 'Installing LICENSE...'
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg2 'Installing dvm binary...'
  install -Dm755 dvm "$_dvm"
  install -Dm755 dvm.bash "$pkgdir/usr/bin/dvm"

  msg2 'Installing installation instruction...'
  install -Dm755 dvm-install-instruction.bash "$pkgdir/usr/bin/dvm-install-instruction"

  msg2 'Generating completion for bash...'
  _completion bash "$pkgdir/usr/share/bash-completion/completions/dvm"

  msg2 'Generating completion for zsh...'
  _completion zsh "$pkgdir/usr/share/zsh/site-functions/_dvm"

  msg2 'Generating completion for fish...'
  _completion fish "$pkgdir/usr/share/fish/completions/dvm.fish"
}
