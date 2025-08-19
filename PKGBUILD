# Maintainer: Nick To <nick at nickto dot net>
pkgname="filen-cli-bin"
pkgver="0.0.36"
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
sha256sums_x86_64=('be690d94d3310187dc7b4fe46b3e49becfb327c29ac64d49cfe73252c7c3c04a')
sha256sums_aarch64=('fda28526b5d11f9e860eb1bce8a8069da30fe03ccb5b58d6558e0c24845cbca4')

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
