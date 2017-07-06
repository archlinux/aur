# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com

_name=firefox
_channel=developer
_lang=it

pkgname="${_name}-${_channel}-it"
pkgdesc='Standalone web browser from mozilla.org, Developer Edition - Italian'
url='https://www.mozilla.org/firefox/developer/'
pkgver=55.0b6
pkgrel=1
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-x86_64/$_lang/firefox-$pkgver.tar.bz2"
        "firefox-$_channel.desktop"
        "vendor.js")
sha512sums=('a4198b115b96605ae7e698637ae3ef7ce7f913cba1c4edaf2a70f978f6e1ffb8ea308bfce29a48db743755d5f4dbc575ec5e8bf95f15216967c17f02b5480ca3'
            '3360768d46a6ac57430f5b5182fa5198dc68d6d65401dde6d33f4fb3a3553b5bceaefc18dcde8b035405265e7ba9e262ebbade6f064465d0e248f5976600ffbc'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
optdepends=(
	'pulseaudio: audio/video playback'
	'ffmpeg: h.264 video'
	'hunspell: spell checking'
	'hyphen: hyphenation'
)

provides=(firefox-developer)
conflicts=(firefox-developer)

package() {
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox $pkgdir/opt/firefox-$_channel

    ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
    install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/firefox-${_channel}-icon.png
    install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}
