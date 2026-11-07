# Maintainer: Enderlava <lava91644@gmail.com>
pkgname=rclone-tgdrive-bin
pkgver=1.75.4
pkgrel=1
pkgdesc="rclone with teldrive added"
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/tgdrive/rclone"
license=("MIT")
provides=("rclone")
conflicts=("rclone")
options=('!strip' '!emptydirs')
depends=(glibc)

_arch_x86_64="amd64"
_arch_aarch64="arm64"
_arch_armv7h="arm-v7"

source_x86_64=("${pkgname}-${pkgver}-amd64.zip::https://github.com/tgdrive/rclone/releases/download/v${pkgver}/rclone-v${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-arm64.zip::https://github.com/tgdrive/rclone/releases/download/v${pkgver}/rclone-v${pkgver}-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-arm-v7.zip::https://github.com/tgdrive/rclone/releases/download/v${pkgver}/rclone-v${pkgver}-linux-arm-v7.zip")
sha256sums_x86_64=('ffa2e1b1aebcd3ed7070fe3364f2b6ee291101f691e67df1c2989404f8264361')
sha256sums_aarch64=('9080a16220ce8e9712cf0ed4b565e1aa9b81e8f6804e8e059c366e06ea839120')
sha256sums_armv7h=('34a131962469d60d366451a318cca32a295ae329f008f0055fed09be3f4e81fc')

package() {
  local _arch_var="_arch_${CARCH}"
  local _target_arch="${!_arch_var}"
  local _dir="rclone-v${pkgver}-linux-${_target_arch}"

  install -Dm755 "${srcdir}/${_dir}/rclone" "${pkgdir}/usr/bin/rclone"

  install -Dm644 "${srcdir}/${_dir}/rclone.1" "${pkgdir}/usr/share/man/man1/rclone.1"
  install -Dm644 "${srcdir}/${_dir}/README.html" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
