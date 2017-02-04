# Maintainer: Denys Vitali <denys+arch-aur@denv.it>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_name=firefox
_channel=developer
pkgname="${_name}-dev"
pkgdesc='Standalone web browser from mozilla.org, developer build'
url='http://www.mozilla.org/firefox/developer'
pkgver=53.0a2_20170204084039
_ffver=53.0a2
_ffbid=20170204084039
# Next version: 53.0a2
# Current BID: 20170204084039
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_ffver}.en-US.linux-${CARCH}"
_srcurl="https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora"
source_i686=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
source_x86_64=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
sha512sums_i686=('85bc7d0863e1a39ecf2f752521917fc75c337a058478fc433f9d419a3bd184a793a67b17833a7ae05637741f4a2882cd26d32c0066b738164a40cc858dc1f0ab' #ff-dev-aurora-sha512
            '9be66aec933af7495398882662b04555abda84b32a24c2f7456b6c1d719b83320aae4c42b913a805073fdf87b476e0ff70a86eeaf48f343a9540c50f6bf26454'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_x86_64=('ce8e6da4d3e15e9c47c5020c653997516a05d9de44f072ce80571085ae78b6768ce75da1fc60a7d442f4574473619b9cbbac24eefeeaaaf39807bfc6deef91d6' #ff-dev-aurora-sha512
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
