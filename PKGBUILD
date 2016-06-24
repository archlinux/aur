# Maintainer: Leo Schwarz aka. evotopid <mail αt leoschwarz Døt com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com> 
_name=firefox
_channel=developer

_release_year=2016
_release_month=06
_release_day=24
_release_time=00-40-13
_release_version=49.0a2

pkgname="${_name}-${_channel}-de"
pkgdesc='Standalone web browser from mozilla.org, developer build - German'
url='http://www.mozilla.org/firefox/developer'
pkgver="${_release_version}_${_release_year}${_release_month}${_release_day}"
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_release_version}.de.linux-${CARCH}"
_release_dir="${_release_year}-${_release_month}-${_release_day}-${_release_time}-mozilla-aurora-l10n"
_srcurl="https://download-installer.cdn.mozilla.net/pub/firefox/nightly/${_release_year}/${_release_month}/${_release_dir}"
source=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'sqlite3' 'dbus-glib')
provides=(firefox-developer)
conflicts=(firefox-developer)

package() {
  install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox $pkgdir/opt/firefox-$_channel

  ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
  install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$pkgname-icon.png
  install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}

md5sums=('19d96983e9809c813fbbf2d1b5cea201'
         '5979b30b19cd645012ce518321fb16f1'
         '32618013911bf84445afce815e3875b1')
