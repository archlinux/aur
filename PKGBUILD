# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=1.1.94
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
  "qodercli_1.1.94_linux_amd64.tar.gz::https://qoder-ide.oss-accelerate.aliyuncs.com/qodercli/releases/1.1.94/qodercli-linux-x64.tar.gz"
)
source_aarch64=(
  "qodercli_1.1.94_linux_arm64.tar.gz::https://qoder-ide.oss-accelerate.aliyuncs.com/qodercli/releases/1.1.94/qodercli-linux-arm64.tar.gz"
)

sha256sums=('1ce434779b1dbabd7b5875986785f4f462013f5e5ff847d43f7eb87f1beb754f'
             'SKIP'
             'SKIP'
             'SKIP')
sha256sums_x86_64=('cba1ecddddaa434628c88eef9d95f4dbbc545169208aab35bac8c0eb1cdc40c3')
sha256sums_aarch64=('a2ddebc6804cb060dcca9c0472ae8f6133f568d73fffd45ccab3bd8590739c12')

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
