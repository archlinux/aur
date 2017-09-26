# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com

_name=firefox
_channel=developer
_lang=it

pkgname="${_name}-${_channel}-${_lang}"
pkgdesc='Standalone web browser from mozilla.org, Developer Edition - Italian'
url='https://www.mozilla.org/firefox/developer/'
pkgver=57.0b3
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

source=("firefox-$_channel.desktop"
        'vendor.js')

sha512sums=('f536b6790233d609182ae4940193727e1e0188b6e49f0c47a5d8ade1bb15a3e311160636d17ce78ab9766781025171d2b6a4a14131d2a40ab490bdbb7c144354'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')

source_i686=("firefox-i686-$pkgver.tar.bz2::https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-i686/$_lang/firefox-$pkgver.tar.bz2")
source_x86_64=("firefox-x86_64-$pkgver.tar.bz2::https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-x86_64/$_lang/firefox-$pkgver.tar.bz2")

sha512sums_i686=('6e0cd3650f2366a28f60b7c67d4ffca3b900c3edc1181f9ae3708b89c37df58c1e9dbcae39fb2b9c10a8885dd0a69a80000579e92312b0a7c0b444677b5133ba')
sha512sums_x86_64=('6ab35fc6892d4a58d77ed5159e4f357caaff1caff7131441a766d554ed0ba4c14c3a170df14ba887f0f1e11bb5b14da718e855ceae75bb274500950f64d937d5')

depends=('gtk3' 'gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'nss' 'hunspell' 'sqlite' 'ttf-font' 'libpulse' 'icu' 'gtk-update-icon-cache')

optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech')

provides=(firefox-developer)
conflicts=(firefox-developer)

package() {
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox $pkgdir/opt/firefox-$_channel

    ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
    install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
    install -Dm644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/firefox-${_channel}.png
    install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}
