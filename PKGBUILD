# Maintainer: Denys Vitali <denys+arch-aur@denv.it>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_name=firefox
_channel=developer
pkgname="${_name}-${_channel}"
pkgdesc='Standalone web browser from mozilla.org, developer build'
url='http://www.mozilla.org/firefox/developer'
pkgver=53.0a2
# Next version: 53.0a2
# Current BID: 20170201084127
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${pkgver}.en-US.linux-${CARCH}"
_srcurl="https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora"
source_i686=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
source_x86_64=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
sha512sums_i686=('3f1b1919aaefdad64c8b9f8ed8f6364b3739a6717271e071bb4bd787de823b5de731d5eabcdb997676ca481430732baab32a3ef4c5c46787989cb4d17342bec9' #ff-dev-aurora-sha512
            '9075e0d67e4dc153dcf514f3aa2b2415ce8b39275eedbf02a3cd122949b95bf4af9dad358516145decf445d1a903d52a634f4eeeb44bb67864de02e646a76631'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_x86_64=('332b771da7125bd5bae7800736e88bcaa26e7d9a8de0c9fbc470d6d2d4f1b4df9b0576a2e93363d169f17e74e567746fa13a321edfebb0d806d3ab1a632033b8' #ff-dev-aurora-sha512
            '9075e0d67e4dc153dcf514f3aa2b2415ce8b39275eedbf02a3cd122949b95bf4af9dad358516145decf445d1a903d52a634f4eeeb44bb67864de02e646a76631'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk3' 'sqlite3' 'dbus-glib')

package() {
  install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox $pkgdir/opt/firefox-$_channel

  ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
  install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$pkgname-icon.png
  ls
  install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}
