pkgname=wireshare
pkgver=7.0
pkgrel=1
pkgdesc="Peer-to-peer sharing for Gnutella, BitTorrent, magnet, and eD2k"
arch=('x86_64')
url="https://github.com/nmatavka/hermes-wireshare"
license=('GPL-3.0-or-later')
depends=('java-runtime>=21')
makedepends=('jdk21-openjdk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nmatavka/hermes-wireshare/releases/download/release/7.0/WireShare-7.0-source.tar.gz")
sha256sums=('1d7fa2db828b7488b010f7ffa13e466c0f5810dab7eb1eb16ffb1eb7070bedef')

build() {
  cd "${srcdir}/hermes-wireshare-${pkgver}"
  ./gradlew --no-daemon wireShareJar
}

package() {
  cd "${srcdir}/hermes-wireshare-${pkgver}"

  install -Dm644 WireShare.jar "${pkgdir}/usr/share/wireshare/WireShare.jar"
  install -Dm755 packaging/common/launchers/WireShare "${pkgdir}/usr/bin/WireShare"
  install -Dm644 packaging/common/app/cx.hermes.WireShare.desktop "${pkgdir}/usr/share/applications/cx.hermes.WireShare.desktop"
  install -Dm644 packaging/common/app/cx.hermes.WireShare.metainfo.xml "${pkgdir}/usr/share/metainfo/cx.hermes.WireShare.metainfo.xml"
  install -Dm644 packaging/common/icons/scalable/apps/cx.hermes.WireShare.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cx.hermes.WireShare.svg"
  install -Dm644 packaging/common/icons/scalable/status/cx.hermes.WireShare.XferDone.svg "${pkgdir}/usr/share/icons/hicolor/scalable/status/cx.hermes.WireShare.XferDone.svg"

  for size in 16 20 22 24 32 36 40 48 64 72 96 128 192 256 384 512 1024; do
    install -Dm644 "packaging/common/icons/hicolor/${size}x${size}/apps/cx.hermes.WireShare.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/cx.hermes.WireShare.png"
    install -Dm644 "packaging/common/icons/hicolor/${size}x${size}/status/cx.hermes.WireShare.XferDone.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/status/cx.hermes.WireShare.XferDone.png"
  done
}
