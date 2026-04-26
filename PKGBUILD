# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=0.2.0
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
  "qodercli_0.2.0_linux_amd64.tar.gz::https://qoder-ide.oss-ap-southeast-1.aliyuncs.com/qodercli/releases/0.2.0/qodercli-linux-x64.tar.gz"
)
source_aarch64=(
  "qodercli_0.2.0_linux_arm64.tar.gz::https://qoder-ide.oss-ap-southeast-1.aliyuncs.com/qodercli/releases/0.2.0/qodercli-linux-arm64.tar.gz"
)

# We include a local LICENSE file (downloaded from https://qoder.com/product-service)
# source+=("LICENSE::https://qoder.com/product-service")
source+=(
  "LICENSE"
  "qodercli.bash"
  "qodercli.zsh"
  "qodercli.fish"
)

sha256sums_x86_64=('e23d06975fc92b1e784cc0740b8b2c354df0e1a26e2d3171ef8339895370d516')
sha256sums_aarch64=('7ba912d7b3bec275f5c56eb8e795dd76cf2dc60ed521e259df30994252a37311')
sha256sums=('d3c504dbae350e697a4d48a44b0689fedb46d1145db9940cefe9eac9b94e0792'
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

