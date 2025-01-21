# Maintainer: Nick To <nick at nickto dot net>
pkgname="filen-cli-bin"
pkgver="0.0.29"
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
sha256sums_x86_64=('65363fc323bae4389055fa94995085ac48f5380ca8942c1b1fa6719e1c350db4')
sha256sums_aarch64=('6c9afe814d07d5125597831d9b0e91c07ed949091082a257ef09733d6796f4b4')

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
