# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=rustic-bin
pkgver=0.7.0
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
b2sums_x86_64=('3cd254f1f47db730ab682b6e2d28fba546950aef34c25faabf7baaa10555b734b7577873b71343619f2eefe21367c59897ed36d65f2efbb835093b12ef3aabfa')
b2sums_aarch64=('d949e127a78ea6a5d5e4f3ce562de340ba8658e63aff8f72dd6bec0e9ed1d2361ab016acf50e251202130601b95b1552f9b19439a3f61d99d858ec715270a099')

package() {
  cd "$srcdir"

  install -Dm755 rustic "$pkgdir/usr/bin/rustic"

  install -Dm644 -t "$pkgdir/usr/share/doc/rustic/config" config/*.toml

  install -Dm644 <("$srcdir"/rustic completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/rustic"
  install -Dm644 <("$srcdir"/rustic completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/rustic.fish"
  install -Dm644 <("$srcdir"/rustic completions zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_rustic"
}
