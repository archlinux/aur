# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=rustic-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Rustic is a backup tool that provides fast, encrypted, deduplicated backups.'
url='https://github.com/rustic-rs/rustic'
source_x86_64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rustic-rs/rustic/releases/download/v$pkgver/rustic-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
arch=('x86_64' 'aarch64')
provides=('rustic')
conflicts=('rustic')
license=('Apache')
changelog=CHANGELOG
b2sums_x86_64=('7712526fcf816efbcc3fa150f36023c1193f489dcf1d3477004b1dcba3dff03ffcd0c4d2bbac1c59126237475d7ed163ecb67aff8d0f8f09e0500bb9df0b8f72')
b2sums_aarch64=('6ca4ed31144434d179dfb47040d5a27c54775f2b5f8e6e761ae692841474d1ed3d9d13bde1c760d63799981d25c589956a7b252165000fc5817f304a60e6d8e7')

package() {
  cd "$srcdir"

  install -Dm755 rustic "$pkgdir/usr/bin/rustic"

  install -Dm644 -t "$pkgdir/usr/share/doc/rustic/config" config/*.toml

  install -Dm644 <("$srcdir"/rustic completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/rustic"
  install -Dm644 <("$srcdir"/rustic completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/rustic.fish"
  install -Dm644 <("$srcdir"/rustic completions zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_rustic"
}
