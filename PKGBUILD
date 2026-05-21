pkgname=wireshare-bin
pkgver=7.0
pkgrel=1
pkgdesc="Peer-to-peer sharing for Gnutella, BitTorrent, magnet, and eD2k (prebuilt jar)"
arch=('x86_64')
url="https://github.com/nmatavka/hermes-wireshare"
license=('GPL-3.0-or-later')
depends=('java-runtime>=21')
source=(
  "wireshare-${pkgver}-source.tar.gz::https://github.com/nmatavka/hermes-wireshare/releases/download/release/7.0/WireShare-7.0-source.tar.gz"
  "WireShare.jar::https://github.com/nmatavka/hermes-wireshare/releases/download/release/7.0/WireShare.jar"
)
sha256sums=('1d7fa2db828b7488b010f7ffa13e466c0f5810dab7eb1eb16ffb1eb7070bedef' '25e8349124a7e1c5ad289f4259aad070b6d2348a73386a4871f48e8f3e2a1ef6')

package() {
  cd "${srcdir}/hermes-wireshare-${pkgver}"

  install -Dm644 "${srcdir}/WireShare.jar" "${pkgdir}/usr/share/wireshare/WireShare.jar"
  install -Dm755 packaging/common/launchers/WireShare "${pkgdir}/usr/bin/WireShare"
  install -Dm644 packaging/common/app/cx.hermes.WireShare.desktop "${pkgdir}/usr/share/applications/cx.hermes.WireShare.desktop"
  install -Dm644 packaging/common/app/cx.hermes.WireShare.metainfo.xml "${pkgdir}/usr/share/metainfo/cx.hermes.WireShare.metainfo.xml"
  install -Dm644 packaging/common/icons/scalable/apps/cx.hermes.WireShare.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cx.hermes.WireShare.svg"
  install -Dm644 packaging/common/icons/scalable/status/cx.hermes.WireShare.XferDone.svg "${pkgdir}/usr/share/icons/hicolor/scalable/status/cx.hermes.WireShare.XferDone.svg"

  for size in 16 20 22 24 32 36 40 48 64 72 96 128 192 256 384 512 1024; do
    install -Dm644 "packaging/common/icons/hicolor/${size}x${size}/apps/cx.hermes.WireShare.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/cx.hermes.WireShare.png"
    install -Dm644 "packaging/common/icons/hicolor/${size}x${size}/status/cx.hermes.WireShare.XferDone.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/status/cx.hermes.WireShare.XferDone.png"
  done

  install -Dm644 nativelibs/linux/libjdic.so "${pkgdir}/usr/lib/wireshare/libjdic.so"
  install -Dm644 nativelibs/linux/libtorrent-wrapper.so "${pkgdir}/usr/lib/wireshare/libtorrent-wrapper.so"
  install -Dm644 nativelibs/linux/libtorrent-wrapper64.so "${pkgdir}/usr/lib/wireshare/libtorrent-wrapper64.so"
  install -Dm644 nativelibs/linux/libtray.so "${pkgdir}/usr/lib/wireshare/libtray.so"
}
