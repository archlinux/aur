# Maintainer: BarbUk <julien.virey@gmail.com>

pkgname=cleanuparr-bin
pkgver=2.3.3
pkgrel=1
pkgdesc='Tool for automating the cleanup of unwanted or blocked files in Sonarr, Radarr, and supported download clients like qBittorrent, Deluge and Transmission.'
arch=(x86_64 aarch64)
url='https://cleanuparr.github.io/Cleanuparr'
license=('GPL-3.0-or-later')
groups=(servarr-bin)
provides=(cleanuparr)
conflicts=(cleanuparr)
options=(!debug !strip)
install=cleanuparr.install
depends=(
  gcc-libs
  glibc
)
source=(
  cleanuparr.service
  cleanuparr.sysusers
  cleanuparr.tmpfiles
  cleanuparr.install
)
source_x86_64=("Cleanuparr-${pkgver}-linux-adm64.zip::https://github.com/Cleanuparr/Cleanuparr/releases/download/v${pkgver}/Cleanuparr-${pkgver}-linux-amd64.zip")
source_aarch64=("Cleanuparr-${pkgver}-linux-arm64.zip::https://github.com/Cleanuparr/Cleanuparr/releases/download/v${pkgver}/Cleanuparr-${pkgver}-linux-arm64.zip")
sha256sums=('e64633347d71185ef886314a74881f81ea70cbb896f285547dfd7739ecbe0188'
            '4606d163398bbfa37f8f6b8967c0bee7c950823f766983699194828f0f8b008e'
            '9a16872bfaeb80898641efc70a92a559c49f3893b792b2ce9be9a4cf7143dbe4'
            '19f295bd0b4d3bb046a4e1bef2808277cdf033297aace97b9e719eec4d2c045e')
sha256sums_x86_64=('19b613f406dcd1d0b31f190d3c5f504d952aa74efa019d378d2b97fc3c81d941')
sha256sums_aarch64=('40161420eba6df9aee9418a949425a83b15fdf7b0f90a39bfee73e51eddd40e5')

package() {
  install -dm755 "${pkgdir}/usr/lib/cleanuparr"

  # Systemd
  install -Dm644 cleanuparr.service "${pkgdir}/usr/lib/systemd/system/cleanuparr.service"
  install -Dm644 cleanuparr.sysusers "${pkgdir}/usr/lib/sysusers.d/cleanuparr.conf"
  install -Dm644 cleanuparr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/cleanuparr.conf"

  # Copy Cleanuparr
  cp -dr Cleanuparr-$pkgver-linux-*/* "${pkgdir}/usr/lib/cleanuparr/"
}
