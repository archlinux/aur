# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=1.1.11
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
  "qodercli_1.1.11_linux_amd64.tar.gz::https://qoder-ide.oss-accelerate.aliyuncs.com/qodercli/releases/1.1.11/qodercli-linux-x64.tar.gz"
)
source_aarch64=(
  "qodercli_1.1.11_linux_arm64.tar.gz::https://qoder-ide.oss-accelerate.aliyuncs.com/qodercli/releases/1.1.11/qodercli-linux-arm64.tar.gz"
)

sha256sums=('769e0934e7ab2795b6329dc9ae58d3bce7178c77fa0dd7f7bd945dfe90495f4a'
             'SKIP'
             'SKIP'
             'SKIP')
sha256sums_x86_64=('2f3c1dcf1b603558383242f30fd2b6fb3d5efb31aa74466f308750824e781b57')
sha256sums_aarch64=('2d90e2420ba61278d54440821d481c9743365ee42abb4125b8986379221941c8')

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
