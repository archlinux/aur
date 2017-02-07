# Maintainer: Denys Vitali <denys+arch-aur@denv.it>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_name=firefox
_channel=developer
pkgname="${_name}-dev"
pkgdesc='Standalone web browser from mozilla.org, developer build'
url='http://www.mozilla.org/firefox/developer'
pkgver=53.0a2_20170207084044
_ffver=53.0a2
_ffbid=20170207084044
# Next version: 53.0a2
# Current BID: 20170207084044
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_ffver}.en-US.linux-${CARCH}"
_srcurl="https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora"
source_i686=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
source_x86_64=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
sha512sums_i686=('3e221e6b2da4e13522549163d2687777618a29dafe149822cebe548fd458b7eaafe1b75fcffa2832e311890d36ce87637602ccd1c40f349686e9e516f5837dbf' #ff-dev-aurora-sha512
            '9be66aec933af7495398882662b04555abda84b32a24c2f7456b6c1d719b83320aae4c42b913a805073fdf87b476e0ff70a86eeaf48f343a9540c50f6bf26454'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_x86_64=('5690274fe60c1e3f8aed051f4c961ae09d511daa4243cac35aa2f4a5e88ef7303b32de8402c29f8e7a8cf4642b354e48d0a467bd099a125a744f8d9618710b6a' #ff-dev-aurora-sha512
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
