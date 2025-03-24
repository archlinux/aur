# Maintainer: Nick To <nick at nickto dot net>
pkgname="filen-cli-bin"
pkgver="0.0.31"
pkgrel=0
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
sha256sums_x86_64=('0361f6490cafbc83b6f84d25845230cfe2ea8fa8e09097646f7e69635411c365')
sha256sums_aarch64=('72f2e60f98acf452b466fbec1141e3ad5bc933503ac98861e0bcf1564a7f1f8b')

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
