# Maintainer: Enderlava <lava91644@gmail.com>
pkgname=rclone-tgdrive-bin
pkgver=1.71.0
pkgrel=1
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
sha256sums_x86_64=('c9b6e7ea44d73e5fef38e7716982c20a21d03c9523a7ec6015e65c183c2ee7d9')
sha256sums_aarch64=('df2742ff27d98fd2bc7b4e84c3ef2cbeda6d5bfa2d576f017e0f155f85b726a5')
sha256sums_armv7h=('bcc0b8a9d4dc2bf88276681274a4046953198c4f020babd39a655fddf3076ef2')

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

