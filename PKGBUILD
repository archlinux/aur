# Maintainer: Boris Drazhzhov <bdrazhzhov@gmail.com>
pkgname=ya-player
pkgver=0.8.0
pkgrel=1
pkgdesc="Yandex Music player"
arch=('x86_64')
license=('BSD-2-Clause')
url='https://github.com/bdrazhzhov/ya-player'
makedepends=('patchelf')
depends=(
  'gstreamer' 'gst-plugins-base-libs'
  'gst-plugins-good' 'gst-plugins-bad'
  'libsoup3' 'webkit2gtk-4.1' 
)
source=("https://github.com/bdrazhzhov/ya-player/releases/download/v$pkgver/ya-player-v$pkgver.tar.zst")
sha256sums=('f559c77143410fe922d4311098ee93d8e2e11c7b5561778db8c1db80689cfb6f')

build() {
  patchelf --set-rpath '$ORIGIN' "$srcdir/lib/libaudio_player_gst_plugin.so"
  patchelf --set-rpath '$ORIGIN' "$srcdir/lib/liburl_launcher_linux_plugin.so"
}

package() {
  install -dm755 "$pkgdir/opt/ya-player"
  install -m755 -s "$srcdir/YaPlayer" "$pkgdir/opt/ya-player"
  cp -r "$srcdir/data" "$pkgdir/opt/ya-player"
  cp -r "$srcdir/lib" "$pkgdir/opt/ya-player"

  install -dm755 "$pkgdir/usr/share/licenses/ya-player"
  cp "$srcdir/LICENCE" "$pkgdir/usr/share/licenses/ya-player"

  install -dm755 "$pkgdir/usr/share/applications"
  cp "$srcdir/YaPlayer.desktop" "$pkgdir/usr/share/applications"

  install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  cp -r "$srcdir/icons"/* "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
