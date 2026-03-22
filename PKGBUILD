# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=0.1.33
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
  "qodercli_${pkgver}_linux_amd64.tar.gz::https://download.qoder.com/qodercli/releases/${pkgver}/qodercli_${pkgver}_linux_amd64.tar.gz"
)
source_aarch64=(
  "qodercli_${pkgver}_linux_arm64.tar.gz::https://download.qoder.com/qodercli/releases/${pkgver}/qodercli_${pkgver}_linux_arm64.tar.gz"
)

# We include a local LICENSE file (downloaded from https://qoder.com/product-service)
# source+=("LICENSE::https://qoder.com/product-service")
source+=(
  "LICENSE"
  "qodercli.bash"
  "qodercli.zsh"
  "qodercli.fish"
)

sha256sums_x86_64=('6381c12788e19c80c7b5349e3c25ef09b82d9e7916890f318fa62801180fd3f4')
sha256sums_aarch64=('5de991c234c94f4fbb2ab721802b9888df4a341413325b3802999006796f61b2')
sha256sums=('13ee1581190160e9e9e4f81b74a4e89f8ea3b050f34e6d6d986c656a89f87e6d'
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

