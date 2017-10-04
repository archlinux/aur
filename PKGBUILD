# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com

_name=firefox
_channel=developer
_lang=it

pkgname="${_name}-${_channel}-${_lang}"
pkgdesc='Standalone web browser from mozilla.org, Developer Edition - Italian'
url='https://www.mozilla.org/firefox/developer/'
pkgver=57.0b5
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

source=("firefox-$_channel.desktop"
        'vendor.js')

sha512sums=('f536b6790233d609182ae4940193727e1e0188b6e49f0c47a5d8ade1bb15a3e311160636d17ce78ab9766781025171d2b6a4a14131d2a40ab490bdbb7c144354'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')

source_i686=("firefox-i686-$pkgver.tar.bz2::https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-i686/$_lang/firefox-$pkgver.tar.bz2")
source_x86_64=("firefox-x86_64-$pkgver.tar.bz2::https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-x86_64/$_lang/firefox-$pkgver.tar.bz2")

sha512sums_i686=('b0fc2fcf5c4ca8fd9b92919dddb1c915786a284bdcc0dd260f1513f84104c81ee281c8fb6ecf2950ad4966a6c57ee2664a125303de97512a70ceeb89d67920f7')
sha512sums_x86_64=('770d3fca967a3ab1c6eca75fff9491349afbcda0e6891f61736b03ce944ec7c614717696ad84153c47a7aab0577f6f721f2f9e53dce56a1f2ba1cba655ce721b')

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
