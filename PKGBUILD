# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=recyclarr-bin
_pkgname="${pkgname%-bin}"
pkgver=7.5.2
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
            'c03ea99bdea959b9da8a71556f58980ffd3967ee6cbab4c11945ab1aebd52246'
            '3d2a1b3690d956a8f195c2cd1b28c28beecda354023e8de78471ca35610fb57d'
            'e8a2959e079a6a77c3eefaf77defd69e76944c2a1378257dcaf0286abde002a6'
            '458b7c0550f3c2e41f63bac197ce55a5699432ee24080f7917b001c0eec2c7ec'
            'f0b6b437fad6072f55be0eb57c4eaf6a44eecda4588633edd5ad716ea3e41c7d')
sha256sums_x86_64=('6f38d5fa6f894d17604fab8aa71e6186cebc7a60235e7a3461a44546acd10978')
sha256sums_aarch64=('d166f61c842297299bf408ae138ec95b59fd85d4eae2f66d482c6ccfcaf00618')
sha256sums_armv7h=('1461fa3d8695b995dd730a9a049431fb813cec401885cd6306bcb901e339558f')

package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 recyclarr "${pkgdir}/usr/bin/recyclarr"
  install -Dm644 recyclarr.yml "${pkgdir}/etc/recyclarr/recyclarr.yml"
  install -Dm644 recyclarr.service "${pkgdir}/usr/lib/systemd/system/recyclarr.service"
  install -Dm644 recyclarr.timer "${pkgdir}/usr/lib/systemd/system/recyclarr.timer"
  install -Dm644 recyclarr.sysusers "${pkgdir}/usr/lib/sysusers.d/recyclarr.conf"
  install -Dm644 recyclarr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/recyclarr.conf"
}
