# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=0.1.41
pkgrel=1
pkgdesc="Qoder Agentic CLI - Advanced AI coding agent from Alibaba"
arch=('x86_64' 'aarch64')
url="https://qoder.com/cli"
license=('LicenseRef-Qoder-Product-Service')
options=('!strip' '!debug')
provides=('qoderclibin')
conflicts=('qoder-cli')

# Binary tarballs from manifest
# https://download.qoder.com/qodercli/channels/manifest.json
source_x86_64=(
  "qodercli_0.1.41_linux_amd64.tar.gz::https://download.qoder.com/qodercli/releases/0.1.41/qodercli_0.1.41_linux_amd64.tar.gz"
)
source_aarch64=(
  "qodercli_0.1.41_linux_arm64.tar.gz::https://download.qoder.com/qodercli/releases/0.1.41/qodercli_0.1.41_linux_arm64.tar.gz"
)

# We include a local LICENSE file (downloaded from https://qoder.com/product-service)
# source+=("LICENSE::https://qoder.com/product-service")
source+=(
  "LICENSE"
  "qodercli.bash"
  "qodercli.zsh"
  "qodercli.fish"
)

sha256sums_x86_64=('75796796d21b46f6e7f537dc68d3c8a655c142d56a9c041713b5fe45cac57bd1')
sha256sums_aarch64=('0c94810b3177b7a6f4ee3cc22ee4ac23469a035f98a262113339835070566c36')
sha256sums=('26cb7fb86ccb40248e7eae7c3c35c1daabaeac8a720b86e36e51a4e48f354a58'
             'SKIP'
             'SKIP'
             'SKIP')

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

