# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="Qoder Agentic CLI - Advanced AI coding agent from Alibaba"
arch=('x86_64' 'aarch64')
url="https://qoder.com/cli"
license=('LicenseRef-Qoder-Product-Service')
options=('!strip' '!debug')
provides=('qoderclibin')
conflicts=('qoder-cli')

# Common sources (LICENSE and shell completions)
source=(
  "LICENSE"
  "qodercli.bash"
  "qodercli.zsh"
  "qodercli.fish"
)

# Binary tarballs from manifest
# https://download.qoder.com/qodercli/channels/manifest.json
# We include a local LICENSE file (from https://qoder.com/product-service)
source_x86_64=(
  "qodercli_1.1.4_linux_amd64.tar.gz::https://qoder-ide.oss-accelerate.aliyuncs.com/qodercli/releases/1.1.4/qodercli-linux-x64.tar.gz"
)
source_aarch64=(
  "qodercli_1.1.4_linux_arm64.tar.gz::https://qoder-ide.oss-accelerate.aliyuncs.com/qodercli/releases/1.1.4/qodercli-linux-arm64.tar.gz"
)

sha256sums=('4ca09c6ecb1d3c80d7ff9df0dc383bc3fc2dacfa6018d0222be32de3a9583752'
             'SKIP'
             'SKIP'
             'SKIP')
sha256sums_x86_64=('111e88edceee045fe2fd1b441b797c972da3242fc1c7c4a9ea5bf43ae4fbff42')
sha256sums_aarch64=('231938c85c3fea78042b904ba4eb325f6d84fd5d73099d22343f313c5a8c798a')

package() {
  # Find the extracted qodercli binary and install
  local bin
  bin="$(find "$srcdir" -type f -name qodercli -print -quit)"
  install -Dm755 "$bin" "$pkgdir/usr/bin/qodercli"

  # Install the LICENSE we downloaded
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install shell completions
  install -Dm644 "$srcdir/qodercli.bash" \
    "$pkgdir/usr/share/bash-completion/completions/qodercli"
  install -Dm644 "$srcdir/qodercli.zsh" \
    "$pkgdir/usr/share/zsh/site-functions/_qodercli"
  install -Dm644 "$srcdir/qodercli.fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/qodercli.fish"
}
