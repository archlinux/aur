# Maintainer: Jan Möller <jan.moeller0@pm.me>

pkgname=gitwatch-rs-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI to watch a git repo and automatically commit changes"
arch=('x86_64')
url="https://github.com/croissong/gitwatch-rs"
license=('MIT')
depends=('libgit2' 'openssl')
makedepends=('rust' 'cargo' 'pkg-config')
provides=('gitwatch')
conflicts=('gitwatch')

source=("$pkgname-$pkgver.tar.gz::https://github.com/croissong/gitwatch-rs/archive/v$pkgver.tar.gz"
        "gitwatch-$CARCH-unknown-linux-gnu-$pkgver.tar.gz::https://github.com/croissong/gitwatch-rs/releases/download/v$pkgver/gitwatch-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('487f44aa8f9598215711a59624463dcba2a5f09392b847833fd7f29a86c3da70'
            'e988e130b7f4429eb817467f6c53ca8f9b9f77dfbb66a6e5a31f5728bf9810f1')

package() {
  # Install binary
  install -Dm755 "$srcdir/gitwatch" "$pkgdir/usr/bin/gitwatch"

  # Install shell completions
  install -Dm644 <("$srcdir/gitwatch" completion bash) "$pkgdir/usr/share/bash-completion/completions/gitwatch"
  install -Dm644 <("$srcdir/gitwatch" completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/gitwatch.fish"
  install -Dm644 <("$srcdir/gitwatch" completion zsh) "$pkgdir/usr/share/zsh/site-functions/_gitwatch"

  # Install man page
  install -Dm644 "$srcdir/gitwatch-rs-$pkgver/docs/gitwatch.1" "$pkgdir/usr/share/man/man1/gitwatch.1"

  # Install license
  install -Dm644 "$srcdir/gitwatch-rs-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
