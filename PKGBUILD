pkgname=tempesta-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust (binary package)"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')
provides=('tempesta')
conflicts=('tempesta')

source_x86_64=("tempesta-x86_64-$pkgver.tar.gz::https://github.com/x71c9/tempesta/releases/download/v$pkgver/tempesta-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("tempesta-aarch64-$pkgver.tar.gz::https://github.com/x71c9/tempesta/releases/download/v$pkgver/tempesta-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=("3332e4db9234eb8cc92776f400c0690caf66b1ed72322f1089096a74094ee6a9")
sha256sums_aarch64=("60d4d4ec571aeeb65c740cb8d8163612cf18f4c625115437f213b8575151efb9")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "tempesta-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "tempesta-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "tempesta" "$pkgdir/usr/bin/tempesta"
  "./tempesta" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/tempesta"
  "./tempesta" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_tempesta"
  "./tempesta" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/tempesta.fish"
  "./tempesta" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/t"
  "./tempesta" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_t"
  "./tempesta" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/t.fish"
  "./tempesta" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/tmps"
  "./tempesta" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_tmps"
  "./tempesta" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/tmps.fish"
  ln -s tempesta "$pkgdir/usr/bin/t"
  ln -s tempesta "$pkgdir/usr/bin/tmps"
}
