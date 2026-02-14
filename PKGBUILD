# Maintainer: Huipeng <cheng.huipeng@outlook.com>
pkgname=qodercli-bin
pkgver=0.1.28
pkgrel=1
pkgdesc="Qoder Agentic CLI - Advanced AI coding agent from Alibaba"
arch=('x86_64' 'aarch64')
url="https://qoder.com/cli"
license=('LicenseRef-Qoder-Product-Service')
options=('!strip' '!debug')
provides=('qoder-cli')
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
source+=("LICENSE::https://qoder.com/product-service")

sha256sums_x86_64=('6db49a8ad86687dbe6dd6c772780552ca1ca23541494f75ca59f53e52f8b0fe1')
sha256sums_aarch64=('2de57a3f30bdf38b71e5d775c0bb53ff6a1c596cae87bd197c3936c57651b8a2')
sha256sums=('5ef99067ca0a66509132e88eb4cf5b7f164174552fa0e3657c6278104811b021')

package() {
  # Find the extracted qodercli binary and install
  local bin
  bin="$(find "$srcdir" -type f -name qodercli -print -quit)"
  install -Dm755 "$bin" "$pkgdir/usr/bin/qodercli"

  # Install the LICENSE we downloaded
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

