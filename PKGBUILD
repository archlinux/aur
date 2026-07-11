# Maintainer: Marcus Ziade <guitaripod@gmail.com>
pkgname=flaccy-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Lossless music player with gapless playback and Last.fm scrobbling (GTK4/libadwaita)"
arch=('x86_64')
url="https://github.com/guitaripod/flaccy"
license=('custom')
depends=('gtk4' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good')
provides=('flaccy')
conflicts=('flaccy')
options=('!strip' '!debug')
source=("https://github.com/guitaripod/flaccy/releases/download/linux-v${pkgver}/flaccy-linux-x86_64.tar.gz")
sha256sums=('e66edb5c30f19383192883b6c74c9820af563c012982b58013c3b728ad4e62fa')

package() {
  cd "$srcdir/flaccy-linux-x86_64"
  install -Dm755 flaccy "$pkgdir/usr/bin/flaccy"
  install -Dm644 data/cc.midgarcorp.Flaccy.desktop "$pkgdir/usr/share/applications/cc.midgarcorp.Flaccy.desktop"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "data/icons/hicolor/${size}x${size}/apps/cc.midgarcorp.Flaccy.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/cc.midgarcorp.Flaccy.png"
  done
  for svg in data/icons/hicolor/scalable/actions/*.svg; do
    [[ -e "$svg" ]] || continue
    install -Dm644 "$svg" \
      "$pkgdir/usr/share/icons/hicolor/scalable/actions/$(basename "$svg")"
  done
}
