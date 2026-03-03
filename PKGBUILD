# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=0.1.29
pkgrel=5
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
source+=("LICENSE")

# Shell completion files are installed from completions/ directory
# Not added to source array to avoid makepkg basename issues

sha256sums_x86_64=('d46c2473c189249f9957dd38064e2580b91c437cd96cef318368d4eec5d08ede')
sha256sums_aarch64=('f2bf01e3459d57922ea510fb7e4b45f76951a1503495eac51f3962074e49533a')
sha256sums=('065b5ac40d587593580b9968db37e96e155c42f3cdcbac6d87d1f39c74861ec9')

package() {
  # Find the extracted qodercli binary and install
  local bin
  bin="$(find "$srcdir" -type f -name qodercli -print -quit)"
  install -Dm755 "$bin" "$pkgdir/usr/bin/qodercli"

  # Install the LICENSE we downloaded
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install shell completions
  install -Dm644 "$startdir/_qodercli" \
    "$pkgdir/usr/share/zsh/site-functions/_qodercli"
  install -Dm644 "$startdir/qodercli.fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/qodercli.fish"
  install -Dm644 "$startdir/qodercli.bash" \
    "$pkgdir/usr/share/bash-completion/completions/qodercli"
}

