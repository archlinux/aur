# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com

_name=firefox
_channel=developer
_lang=it

pkgname="${_name}-${_channel}-${_lang}"
pkgdesc='Standalone web browser from mozilla.org, Developer Edition - Italian'
url='https://www.mozilla.org/firefox/developer/'
pkgver=55.0b14
pkgrel=1
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-x86_64/$_lang/firefox-$pkgver.tar.bz2"
        "firefox-$_channel.desktop"
        "vendor.js")
sha512sums=('3ea4702f4378a6c2756e9b7f1c964dca37175b4724d9a5f63b3bd20246a7bbff0d530cb8d2ea32e474ed1dc22cbaeb6e52500ed6a93e5d4ef0b4a4fee03a7a5f'
            '9e7bb3b08d58c7ec50fd24a5ecab9a6462084a37deb8ec61b089e2c1ad5364c82f71e3fcba918738ded9c61d58bfe8b2dea24abb48e53175332b03727c26c33a'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib' 'gtk-update-icon-cache')
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
    install -Dm644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/firefox-${_channel}.png
    install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}
