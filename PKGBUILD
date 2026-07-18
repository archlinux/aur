# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=1.0.48
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
  "qodercli_1.0.48_linux_amd64.tar.gz::https://qoder-ide.oss-accelerate.aliyuncs.com/qodercli/releases/1.0.48/qodercli-linux-x64.tar.gz"
)
source_aarch64=(
  "qodercli_1.0.48_linux_arm64.tar.gz::https://qoder-ide.oss-accelerate.aliyuncs.com/qodercli/releases/1.0.48/qodercli-linux-arm64.tar.gz"
)

sha256sums=('750ae88d1142775964375ea23e07920a816f9982d3453104db38fa5345ac11e3'
             'SKIP'
             'SKIP'
             'SKIP')
sha256sums_x86_64=('72a6346d1e9654fe356b39616790c108bf73c3af84ea7ef6a3f8974f35ff9950')
sha256sums_aarch64=('6e59fa16a2a4e5b16ab5af8f808d56d55acfc830140fd54cb2fe93982605f281')

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
