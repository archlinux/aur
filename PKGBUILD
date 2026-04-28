# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=0.2.3
pkgrel=2
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
  "qodercli_0.2.3_linux_amd64.tar.gz::https://qoder-ide.oss-ap-southeast-1.aliyuncs.com/qodercli/releases/0.2.3/qodercli-linux-x64.tar.gz"
)
source_aarch64=(
  "qodercli_0.2.3_linux_arm64.tar.gz::https://qoder-ide.oss-ap-southeast-1.aliyuncs.com/qodercli/releases/0.2.3/qodercli-linux-arm64.tar.gz"
)

# We include a local LICENSE file (downloaded from https://qoder.com/product-service)
# source+=("LICENSE::https://qoder.com/product-service")
source+=(
  "LICENSE"
  "qodercli.bash"
  "qodercli.zsh"
  "qodercli.fish"
)

sha256sums_x86_64=('a81379dcd18fa7f46e643ebde5fbcd3b0c3fedc3017120998f654dbb0a916900')
sha256sums_aarch64=('1b3bd28798da575ce67f27732efee7d9b22a1e046d75b94f307b2bb8cc701b7d')
sha256sums=('5b1047e1ed2061db26cbde69d8fc173ebcf017d7ce507c738c822ca22844ab42'
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

