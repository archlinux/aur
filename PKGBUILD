# Maintainer: Nick To <nick at nickto dot net>
pkgname="filen-cli-bin"
pkgver="0.0.39"
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
sha256sums_x86_64=('2a6aec0c2167862b4d61bf98699e78949a52ef52697573db517a908bc2aa88c8')
sha256sums_aarch64=('9a031a6d79235b6d58d74a1c9c7a416cac4d7795596a01d764ee436bfd5387dc')

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
