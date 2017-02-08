# Maintainer: Denys Vitali <denys+arch-aur@denv.it>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_name=firefox
_channel=developer
pkgname="${_name}-dev"
pkgdesc='Standalone web browser from mozilla.org, developer build'
url='http://www.mozilla.org/firefox/developer'
pkgver=53.0a2_20170208084106
_ffver=53.0a2
_ffbid=20170208084106
# Next version: 53.0a2
# Current BID: 20170208084106
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_ffver}.en-US.linux-${CARCH}"
_srcurl="https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora"
source_i686=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
source_x86_64=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
sha512sums_i686=('fdd9ea6bcad7a062b87232ea80b3748f1467e558b0c85a110dfd5314690b561104a0a08a2489d8e57a7b72cb3a0c1c4299f1a5fa97863ff181142dc964262d69' #ff-dev-aurora-sha512
            '9be66aec933af7495398882662b04555abda84b32a24c2f7456b6c1d719b83320aae4c42b913a805073fdf87b476e0ff70a86eeaf48f343a9540c50f6bf26454'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_x86_64=('72dbf22d8ab2636ea040aa1e4d42a74ad35206e1b639bbf551d5fa40f0f9fb1f65f0165d526ffa76096174bd09814d42ef354b1c55bc165e9674ebcd444de4ea' #ff-dev-aurora-sha512
            '9be66aec933af7495398882662b04555abda84b32a24c2f7456b6c1d719b83320aae4c42b913a805073fdf87b476e0ff70a86eeaf48f343a9540c50f6bf26454'
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
