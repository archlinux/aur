# Maintainer: 4679kun <btchina@live.com>

pkgname=firefox-beta-bin-zh
pkgver=40.0b4
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org! Latest beta with Simplified Chinese language"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/zh-CN/firefox/channel/#beta"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types' 'nss' 'sqlite')
optdepends=('gst-plugins-base: vorbis decoding, ogg demuxing'
            'gst-plugins-good: webm and mp4 demuxing'
            'gst-plugins-bad: aac, vp8 and opus decoding'
            'gst-plugins-ugly: h.264 and mp3 decoding'
            'gst-libav: more decoders'
            'libpulse: PulseAudio driver'
            'networkmanager: Location detection via available WiFi networks')
makedepends=('pacman>=4.2.0')
install=firefox-beta-bin.install
source=("firefox-beta-bin.desktop"
        "firefox-beta-bin-safe.desktop")
source_i686=("http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/linux-i686/zh-CN/firefox-$pkgver.tar.bz2")
source_x86_64=("http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/linux-x86_64/zh-CN/firefox-$pkgver.tar.bz2")
md5sums=('13bd50c37f55a83539a680ce83162468'
         '2d8d3cd7de5ffca9efc02aca300a51d6')
md5sums_i686=('c2ba478d9618662f0cd96f45f6c4462d')
md5sums_x86_64=('16117352639757d8b9e6af9b1074ea49')
# RC
if [[ $_build = ? ]]; then
  source_i686=("http://ftp.mozilla.org/pub/mozilla.org/firefox/candidates/$_major-candidates/build$_build/linux-i686/zh-CN/firefox-$_major.tar.bz2")
  source_x86_64=("http://ftp.mozilla.org/pub/mozilla.org/firefox/candidates/$_major-candidates/build$_build/linux-x86_64/zh-CN/firefox-$_major.tar.bz2")
fi

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/128x128/apps
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r firefox/ "$pkgdir"/opt/firefox-beta-bin-$pkgver

  # /usr/bin link
  ln -s /opt/firefox-beta-bin-$pkgver/firefox "$pkgdir"/usr/bin/firefox-beta-bin

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/firefox-beta-bin-$pkgver/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/firefox-beta-bin.png
  done

  ln -s /opt/firefox-beta-bin-$pkgver/browser/icons/mozicon128.png \
        "$pkgdir"/usr/share/icons/hicolor/128x128/apps/firefox-beta-bin.png
}
