# Maintainer: Enderlava <lava91644@gmail.com>
pkgname=rclone-tgdrive-bin
pkgver=1.73.1
pkgrel=2
pkgdesc="rclone with teldrive added"
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/tgdrive/rclone"
license=("MIT")
provides=("rclone")
conflicts=("rclone")
options=('!strip' '!emptydirs')
depends=(glibc)
makedepends=(unzip)
source_x86_64=("rclone-v${pkgver}-linux-amd64.zip::https://github.com/tgdrive/rclone/releases/download/v${pkgver}/rclone-v${pkgver}-linux-amd64.zip")
source_aarch64=("rclone-v${pkgver}-linux-arm64.zip::https://github.com/tgdrive/rclone/releases/download/v${pkgver}/rclone-v${pkgver}-linux-arm64.zip")
source_armv7h=("rclone-v${pkgver}-linux-arm-v7.zip::https://github.com/tgdrive/rclone/releases/download/v${pkgver}/rclone-v${pkgver}-linux-arm-v7.zip")
sha256sums_x86_64=('83966547d8979756e7b37706cfd45029fd0db1d2b62125e9c93e85db7b286c43')
sha256sums_aarch64=('32425ef9f7c400fa6ca941d8bd974dbc44bc5b09fb44beb9cd8640256ad7e01e')
sha256sums_armv7h=('acb3b81d940c8e0fc1b12c444ee0c0fb329241973d142bff7cb25f7eaeb18caf')

prepare() {
  cd "$srcdir"
  unzip -o *.zip
}

package() {
  cd "$srcdir"
  local bin
  bin=$(find . -type f -name 'rclone' -executable | head -n 1)
  if [[ -z "$bin" ]]; then
    bin=$(find . -type f -executable | xargs du 2>/dev/null | sort -n | tail -n1 | cut -f2)
  fi
  install -Dm755 "$bin" "$pkgdir/usr/bin/rclone"
}

