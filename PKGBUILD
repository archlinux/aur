# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=1.1.98
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
  "qodercli_1.1.98_linux_amd64.tar.gz::https://qoder-ide.oss-accelerate.aliyuncs.com/qodercli/releases/1.1.98/qodercli-linux-x64.tar.gz"
)
source_aarch64=(
  "qodercli_1.1.98_linux_arm64.tar.gz::https://qoder-ide.oss-accelerate.aliyuncs.com/qodercli/releases/1.1.98/qodercli-linux-arm64.tar.gz"
)

sha256sums=('d595394cdc888f418a8dad1abc99194e67c3ef4baa24b3514fe1a92ae65fec89'
             'SKIP'
             'SKIP'
             'SKIP')
sha256sums_x86_64=('b112f9eb00d8e74a781d0d3ed944f04913b1edb152c6d0d8f0753eba5e947456')
sha256sums_aarch64=('6a055cbde1da0f4222304228ea7b9b08e2435e9f71ff86e23d81631569fd8ecb')

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
