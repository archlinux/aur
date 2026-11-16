# Maintainer: Kasui92 <info@lucapattocchio.dev>
pkgname=lancher
pkgver=0.4.0
pkgrel=1
pkgdesc="A minimal, local project-template manager written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/lancher-dev/lancher"
license=('MIT')
options=('!debug')
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$pkgname-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$pkgname-linux-arm64")
sha256sums_x86_64=('5bcc46317a264c38d39c2ed05a9c45aa4747f107aa3c4aa40257e6064ee1bb8d')
sha256sums_aarch64=('4bfbb0acd2d66cc32cc6cf3c4a6aaf4b70c9a28f9bfc54cb30f2af98b407eab7')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$pkgname"

  local bin="$pkgdir/usr/bin/$pkgname"
  "$bin" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  "$bin" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  "$bin" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
