# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=audiorelay
pkgver=0.27.5
pkgrel=1
_jre_ver=19
pkgdesc="Stream your PC audio to your phone"
arch=('x86_64')
url="https://audiorelay.net"
license=('unknown')
depends=('alsa-lib' 'flac' 'harfbuzz' 'libogg' 'libpulse' # "java-runtime=${_jre_ver}"
         'libvorbis' 'libxau' 'libxcb' 'systemd-libs' 'xdg-utils') # 'opus' 'portaudio' 'rtaudio'
source=("https://dl.audiorelay.net/setups/linux/$pkgname-$pkgver.deb")
sha256sums=('b4b00d3ba21718df61021a67cb7b3eaab5dfaaa779bef7e3247054a079cd3dee')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  install -d "$pkgdir"/usr/{bin,/share/{pixmaps,applications}}
  ln -s "/opt/$pkgname/bin/AudioRelay" "$pkgdir/usr/bin/$pkgname"
  ln -s "/opt/$pkgname/lib/$pkgname-AudioRelay.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  ln -s "/opt/$pkgname/lib/AudioRelay.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # Remove bundled JVM
#  rm -rf "$pkgdir/opt/$pkgname/lib/runtime/"*

  # Symlink system JVM
#  install -d "$pkgdir/usr/lib"
#  ln -s "/usr/lib/jvm/java-${_jre_ver}-openjdk/"* "$pkgdir/opt/$pkgname/lib/runtime/"

  # Symlink libs
#  ln -s /usr/lib/libportaudio.so "$pkgdir/usr/lib/libnative-portaudio.so"
#  ln -s /usr/lib/libopus.so "$pkgdir/usr/lib/libnative-opus.so"
#  ln -s /usr/lib/librtaudio.so "$pkgdir/usr/lib/libnative-rtaudio.so"
}
