# Maintainer: Nick To <nick at nickto dot net>
pkgname="filen-cli-bin"
pkgver="0.0.26"
pkgrel=1
pkgdesc="The Filen CLI provides a set of useful tools for interacting with the cloud."
arch=("x86_64" "aarch64")
url="https://github.com/FilenCloudDienste/filen-cli"
license=("AGPL3")
depends=()
provides=("filen-cli")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
options=(!strip)
source_x86_64=("https://github.com/FilenCloudDienste/filen-cli/releases/download/v${pkgver}/filen-cli-v${pkgver}-linux-x64")
source_aarch64=("https://github.com/FilenCloudDienste/filen-cli/releases/download/v${pkgver}/filen-cli-v${pkgver}-linux-arm64")
sha256sums_x86_64=('349fc843d87aa8ebdc493c2f26c7dc6a11a1ec0050ec26fc54e8a7427594cc0a')
sha256sums_aarch64=('327b4eacf27a344038a70a43609b651954073e48c5672a7d47e87368434b2aac')

package() {
  local src_file
  if [[ "$CARCH" == "x86_64" ]]; then
    src_file="$srcdir/filen-cli-v${pkgver}-linux-x64"
  elif [[ "$CARCH" == "aarch64" ]]; then
    src_file="$srcdir/filen-cli-v${pkgver}-linux-arm64"
  else
    echo "Unsupported architecture: $CARCH"
    exit 1
  fi

  install -Dm755 "$src_file" "$pkgdir/usr/bin/filen-cli"
}
