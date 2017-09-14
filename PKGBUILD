# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com

_name=firefox
_channel=developer
_lang=it

pkgname="${_name}-${_channel}-${_lang}"
pkgdesc='Standalone web browser from mozilla.org, Developer Edition - Italian'
url='https://www.mozilla.org/firefox/developer/'
pkgver=56.0b12
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

source=("firefox-$_channel.desktop"
        'vendor.js')

sha512sums=('f536b6790233d609182ae4940193727e1e0188b6e49f0c47a5d8ade1bb15a3e311160636d17ce78ab9766781025171d2b6a4a14131d2a40ab490bdbb7c144354'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')

source_i686=("https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-i686/$_lang/firefox-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-x86_64/$_lang/firefox-$pkgver.tar.bz2")

sha512sums_i686=('31811f5668f8f7aa7a5d2920820c69a05bbbb14dfc39005cc8a69108522dd9d0850c5dafdd8c520bba275934ff98313f63a6fef180f5724f24c350635794a710')
sha512sums_x86_64=('76954dd37a518252dcbd37f83ae09b64c3acf2f42919030592303a2ddef45593e589b03e49ae6515387fff938e357c4a54de7dc4f4439d882dde067f5104a658')

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
