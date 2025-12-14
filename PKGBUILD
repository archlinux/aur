# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor Jiri Pospisil <jiri@jpospisil.com>

pkgname=rustic-bin
pkgver=0.10.2
pkgrel=1
pkgdesc='Fast, encrypted, deduplicated backups powered by Rust (reads and writes restic repos) (arm binaries)'
url='https://github.com/rustic-rs/rustic'
source_aarch64=("$url/releases/download/v$pkgver/rustic-v$pkgver-1-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/rustic-v$pkgver-1-armv7-unknown-linux-gnueabihf.tar.gz")
arch=('aarch64' 'armv7h')
provides=('rustic')
conflicts=('rustic')
license=('Apache-2.0' 'MIT')
b2sums_aarch64=('ecd4ab886fe12748367b7e263443da11c169391d8b3aaeff8a19f7df5eb68bb6a7b7d1fcb8ee2fa549381401f9749b1b48fb40b3b19b2d7c93150365a32ab992')
b2sums_armv7h=('f7e69e3d43e3f4cb9c29d2061a77e0f69ccca8d4209d449efa164038a53daa9fcd26eebd68e0dbe32a81d68e07c585b658174f98eaf6210a272e1bdb6c9fbc9a')

package() {
  cd "$srcdir"

  install -D -m 755 rustic "$pkgdir/usr/bin/rustic"

  install -D -m 644 config/*.toml -t "$pkgdir/usr/share/doc/rustic/config"

  install -D -m 644 <("$srcdir"/rustic completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/rustic"
  install -D -m 644 <("$srcdir"/rustic completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/rustic.fish"
  install -D -m 644 <("$srcdir"/rustic completions zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_rustic"
}
