# Maintainer: BarbUk <julien.virey@gmail.com>

pkgname=cleanuparr-bin
pkgver=2.9.14
pkgrel=1
pkgdesc='Tool for automating the cleanup of unwanted or blocked files in Sonarr, Radarr, and supported download clients like qBittorrent, Deluge and Transmission.'
arch=(x86_64 aarch64)
url='https://github.com/Cleanuparr/Cleanuparr'
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
source_x86_64=("Cleanuparr-${pkgver}-linux-adm64.zip::$url/releases/download/v${pkgver}/Cleanuparr-${pkgver}-linux-amd64.zip")
source_aarch64=("Cleanuparr-${pkgver}-linux-arm64.zip::$url/releases/download/v${pkgver}/Cleanuparr-${pkgver}-linux-arm64.zip")
sha256sums=('e64633347d71185ef886314a74881f81ea70cbb896f285547dfd7739ecbe0188'
            '4606d163398bbfa37f8f6b8967c0bee7c950823f766983699194828f0f8b008e'
            '9a16872bfaeb80898641efc70a92a559c49f3893b792b2ce9be9a4cf7143dbe4'
            '19f295bd0b4d3bb046a4e1bef2808277cdf033297aace97b9e719eec4d2c045e')
sha256sums_x86_64=('ca09f7ba06369bd63dfc22ff6e2fae1a8e2053690364b53f45a00b378f0710fa')
sha256sums_aarch64=('d4389ab5ff2db5f9dbd56119cc294a9d63c7fff68102c61581d1fa065ab728c7')

package() {
  install -dm755 "${pkgdir}/usr/lib/cleanuparr"

  # Systemd
  install -Dm644 cleanuparr.service "${pkgdir}/usr/lib/systemd/system/cleanuparr.service"
  install -Dm644 cleanuparr.sysusers "${pkgdir}/usr/lib/sysusers.d/cleanuparr.conf"
  install -Dm644 cleanuparr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/cleanuparr.conf"

  # Copy Cleanuparr
  cp -dr Cleanuparr-$pkgver-linux-*/* "${pkgdir}/usr/lib/cleanuparr/"
}
