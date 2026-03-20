# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=recyclarr-bin
_pkgname="${pkgname%-bin}"
pkgver=8.5.1
pkgrel=1
pkgdesc='Automatically synchronize recommended settings from the TRaSH guides to your Sonarr/Radarr instances'
arch=(x86_64 aarch64 armv7h)
url='https://recyclarr.dev'
license=('MIT')
depends=(
  gcc-libs
  glibc
  sqlite
  zlib
)
optdepends=(
  'sonarr: Smart PVR for newsgroup and torrent users'
  'radarr: Movie organizer/manager for usenet and torrent users'
)
provides=(recyclarr)
conflicts=(recyclarr)
backup=('etc/recyclarr/recyclarr.yml')
options=(!debug !strip)
source=(
  "https://github.com/recyclarr/recyclarr/raw/refs/tags/v${pkgver}/LICENSE"
  recyclarr.service
  recyclarr.sysusers
  recyclarr.timer
  recyclarr.tmpfiles
  recyclarr.yml
)
source_x86_64=("${_pkgname}-${pkgver}.linux-x64.tar.xz::https://github.com/recyclarr/recyclarr/releases/download/v${pkgver}/recyclarr-linux-x64.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}.linux-arm64.tar.xz::https://github.com/recyclarr/recyclarr/releases/download/v${pkgver}/recyclarr-linux-arm64.tar.xz")
source_armv7h=("${_pkgname}-${pkgver}.linux-arm.tar.xz::https://github.com/recyclarr/recyclarr/releases/download/v${pkgver}/recyclarr-linux-arm.tar.xz")
sha256sums=('0dde0ee4db0e535bad3b4f20a2a30736c4656f8987f2d5dc70e53fbee4c34c41'
            '878fa21d90d1f67d8809b90e98363f52fd71b513b11600279f47d6c4f81f88c1'
            '3d2a1b3690d956a8f195c2cd1b28c28beecda354023e8de78471ca35610fb57d'
            'e8a2959e079a6a77c3eefaf77defd69e76944c2a1378257dcaf0286abde002a6'
            '458b7c0550f3c2e41f63bac197ce55a5699432ee24080f7917b001c0eec2c7ec'
            'ed7f78e603f778e8a80aeb73d4e4781ff900fed8704d72ea7e2d48205f1cc0eb')
sha256sums_x86_64=('35706bddfb89e4d2e8641db6e0b229470b05a76c827efc294c8d0c26c50f58be')
sha256sums_aarch64=('3e5054407399ffffae649b35b4ef9605a011094e48b3a08f66dd54bc329f881d')
sha256sums_armv7h=('8abe5abc786ddd44cd21b4ee2c767ce600f3ae7a060288cd03771d4d58975073')

package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 recyclarr "${pkgdir}/usr/bin/recyclarr"
  install -Dm644 recyclarr.yml "${pkgdir}/etc/recyclarr/recyclarr.yml"
  install -Dm644 recyclarr.service "${pkgdir}/usr/lib/systemd/system/recyclarr.service"
  install -Dm644 recyclarr.timer "${pkgdir}/usr/lib/systemd/system/recyclarr.timer"
  install -Dm644 recyclarr.sysusers "${pkgdir}/usr/lib/sysusers.d/recyclarr.conf"
  install -Dm644 recyclarr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/recyclarr.conf"
}
