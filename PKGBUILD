pkgname=tempesta-bin
pkgver=0.4.1
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

sha256sums_x86_64=("e718dc55f9a84ec9f5c4de43732ec793afd85e6052d2df6d7f5cbc3414ffa0f9")
sha256sums_aarch64=("c3cb39ae0a27c4a728d8847d96c88a00aeae6e2ba2c14537382d232d87a2f491")

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
