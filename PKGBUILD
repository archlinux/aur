# Maintainer Frede Hundewadt <f at hundewadt dot dk>
_name=firefox
_channel=developer
_locale=da
pkgname="$_name-$_channel-$_locale"
pkgdesc='Standalone web browser from mozilla.org, developer build - Danish'
url='http://www.mozilla.org/firefox/developer'
pkgver=53.0a2
pkgrel=4
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="$_name-$pkgver.$_locale.linux-$CARCH"
_srcurl="https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora-l10n"
source=("$_srcurl/$_file.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
sha512sums=('ea2b99cd3d815497fd3c7880ef347e68d94f4af093d148ae243f8c6ada513a77e143fec14b7c57be9baa1ae1210f1a3d0c2174b97482d3851cda86a1995e354c'
            'b109b884ed79e9e214541750a0fcac8d7d8891cc7f0e0d472b717a5b71e569ab5852534bceaab045a5b13a9290a7905604d08fe97e28c675a2266c30fe719cb6'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'sqlite3' 'dbus-glib')

package() {
  install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox $pkgdir/opt/firefox-$_channel
  ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
  install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$pkgname-icon.png
  ls
  install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}

