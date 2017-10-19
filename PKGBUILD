# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Based on Marco Scarpetta's PKGBUILD

_name=firefox
_lang=pl
_channel=developer
pkgname=firefox-developer-pl
pkgdesc='Standalone web browser from mozilla.org, Developer Edition - Polish'
url='https://www.mozilla.org/firefox/developer/'
pkgver=57.0b9
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

source=("firefox-$_channel.desktop" vendor.js)
source_i686=(https://ftp.mozilla.org/pub/devedition/releases/${pkgver}/linux-i686/${_lang}/firefox-${pkgver}.tar.bz2)
source_x86_64=(https://ftp.mozilla.org/pub/devedition/releases/${pkgver}/linux-x86_64/${_lang}/firefox-${pkgver}.tar.bz2)
sha256sums=('7eced335f7d942ff5bb4431332496e7ebde24e441490f045f915157d4fa20af5'
            'a605391acbcf6096f1db3c8c31c75bcacbe067dbb341a8b7529718dd246cd38e')
sha256sums_i686=('14d75d1942d821c36ab48fd56aaf47592e4d11135cf1b8f0c91ca710ac864eea')
sha256sums_x86_64=('14d75d1942d821c36ab48fd56aaf47592e4d11135cf1b8f0c91ca710ac864eea')

depends=('gtk3' 'gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'nss' 'hunspell' 'sqlite' 'ttf-font' 'libpulse' 'icu' 'gtk-update-icon-cache')
# depends+=(lib32-gtk3 lib32-dbus-glib)
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
