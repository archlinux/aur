# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=recyclarr-bin
_pkgname="${pkgname%-bin}"
pkgver=8.7.0
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
sha256sums_x86_64=('bf4cd067de98b75c87146c1331020c9a5de2be56505fd5b4ab1055ce3937dc4a')
sha256sums_aarch64=('322ad674e359f3b70ad9455cdf73e164ba03bb7c6b0c0e0cbd9c59d0c9c740b8')
sha256sums_armv7h=('9537d6f6a573601340267ddf6070c128bff1577508fa7c85ede99f3fa35ab1b6')

package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 recyclarr "${pkgdir}/usr/bin/recyclarr"
  install -Dm644 recyclarr.yml "${pkgdir}/etc/recyclarr/recyclarr.yml"
  install -Dm644 recyclarr.service "${pkgdir}/usr/lib/systemd/system/recyclarr.service"
  install -Dm644 recyclarr.timer "${pkgdir}/usr/lib/systemd/system/recyclarr.timer"
  install -Dm644 recyclarr.sysusers "${pkgdir}/usr/lib/sysusers.d/recyclarr.conf"
  install -Dm644 recyclarr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/recyclarr.conf"
}
